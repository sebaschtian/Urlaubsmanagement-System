*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lhc_mitarbeiter DEFINITION INHERITING FROM cl_abap_behavior_handler.
    PRIVATE SECTION.

*        VERBINDUNG ZUR BEHAVIOR DEFINITION (APP 2)
*       METHODS get_global_authorization FOR GLOBAL AUTHORIZATION
*            IMPORTING REQUEST requested_authorization FOR zsp_r_mitarbeiter RESULT result.

        METHODS get_global_authorization_i FOR GLOBAL AUTHORIZATION
            IMPORTING REQUEST requested_authorization FOR ANTRAG RESULT result.


*        Urlaub Ablehnen oder Zustimmen Aus App 2
*        METHODS Urlaub_Zustimmen For MODIFY
*            IMPORTING keys FOR ACTION ANTRAG~Urlaub_Zustimmen RESULT result.
*
*        METHODS Urlaub_Ablehnen For MODIFY
*            IMPORTING keys FOR ACTION Antrag~Urlaub_Ablehnen RESULT result.

*        Standard Status setzen
        METHODS Standart_status For DETERMINE ON MODIFY     "ERLEDIGT"
            IMPORTING keys FOR Antrag~Standart_status.

        METHODS Urlaub_bestimmen For DETERMINE ON MODIFY
            IMPORTING keys FOR Antrag~Urlaub_bestimmen.

*        Urlaubstage Berücksichtigen, Feiertage und Wochende Berücksichtigen
        METHODS ValidiertTage FOR VALIDATE ON SAVE
            IMPORTING keys FOR Antrag~ValidiertTage.

        METHODS Validiert_UTtage FOR VALIDATE ON SAVE
            IMPORTING keys FOR ANTRAG~Validiert_UTtage.

endclass.


class lhc_mitarbeiter IMPLEMENTATION.
*    METHOD get_instance_authorizations.
*    ENDMETHOD.
    METHOD get_global_authorization_i.
    Endmethod.


*   Standart Status auf B setzen
    METHOD Standart_status.
        " Read Anträge
        READ ENTITY IN LOCAL MODE zsp_r_antrag
             FIELDS ( status )
             WITH CORRESPONDING #( keys )
             RESULT DATA(vacrequests).

        " ANtrag Anpassen
        MODIFY ENTITY IN LOCAL MODE zsp_r_antrag
               UPDATE FIELDS ( status )
               WITH VALUE #( FOR vr IN vacrequests
                             ( %tky   = vr-%tky
                               Status = 'B' ) ).
    ENDMETHOD.

    METHOD Urlaub_bestimmen.
        " Read Inquiries
        READ ENTITY IN LOCAL MODE zsp_r_antrag
             FIELDS ( Startdatum Enddatum )
             WITH CORRESPONDING #( keys )
             RESULT DATA(vacrequests).

        LOOP AT vacrequests INTO DATA(vacrequest).

          DATA(startdatum) = vacrequest-Startdatum.
          startdatum = startdatum - 1.
          TRY.
              DATA(kalender) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
              DATA(werktage) = kalender->calc_workingdays_between_dates( iv_start = startdatum iv_end = vacrequest-Enddatum ).
            CATCH cx_fhc_runtime.
          ENDTRY.

          MODIFY ENTITY IN LOCAL MODE zsp_r_antrag
                 UPDATE FIELDS ( Urlaubstage )
                 WITH VALUE #( FOR vr IN vacrequests
                               ( %tky   = vr-%tky
                                 Urlaubstage = werktage ) ).
        ENDLOOP.
    ENDMETHOD.

    METHOD ValidiertTage.
        Data message type ref to zsp_cm_Mitarbeiter.
        DATA(lo_context_info) = NEW cl_abap_context_info( ).
        DATA(lv_current_date) = lo_context_info->get_system_date( ).
        " Read Travels
        READ ENTITY IN LOCAL MODE zsp_r_antrag
             FIELDS ( Startdatum Enddatum )
             WITH CORRESPONDING #( keys )
             RESULT DATA(vacrequests).
        " Process Travels
        LOOP AT vacrequests INTO DATA(vacrequest).
        " Validate Dates and Create Error Message
          IF vacrequest-Enddatum < vacrequest-Enddatum.
            message = NEW zsp_cm_mitarbeiter( textid = zsp_cm_mitarbeiter=>EndeVorStart
            severity = if_abap_behv_message=>severity-error ).
            APPEND VALUE #( %tky = vacrequest-%tky
                            %msg = message ) TO reported-zsp_r_urlaub.
            APPEND VALUE #( %tky = vacrequest-%tky ) TO failed-zsp_r_urlaub.
          ENDIF.

          IF vacrequest-enddatum < lv_current_date.
            message = NEW zsp_cm_Mitarbeiter( textid = zsp_cm_mitarbeiter=>Datum_verpasst
            severity = if_abap_behv_message=>severity-error ).
            APPEND VALUE #( %tky = vacrequest-%tky
                            %msg = message ) TO reported-zsp_r_urlaub. "Wieso urlaub aber nicht Antrag"
            APPEND VALUE #( %tky = vacrequest-%tky ) TO failed-zsp_r_urlaub.
          ENDIF.
        ENDLOOP.
    ENDMETHOD.

    METHOD Validiert_UTtage.
        DATA message TYPE REF TO zsp_cm_mitarbeiter.

        " Read Travels
        READ ENTITY IN LOCAL MODE zsp_r_antrag
             FIELDS ( startdatum Enddatum AntragstellerName )
             WITH CORRESPONDING #( keys )
             RESULT DATA(vacrequests).

        " Process Travels
        LOOP AT vacrequests INTO DATA(vacrequest). "Zwischenspeicher für Daten: vacrequest"
          TRY.
              DATA(startdatum) = vacrequest-Enddatum.
              startdatum -= 1.
              DATA(kalender) = cl_fhc_calendar_runtime=>create_factorycalendar_runtime( 'SAP_DE_BW' ).
              DATA(werktage) = kalender->calc_workingdays_between_dates( iv_start = startdatum
                                                                         iv_end   = vacrequest-Enddatum ).
            CATCH cx_fhc_runtime.
          ENDTRY.

          SELECT FROM zsp_r_mitarbeiter
               FIELDS  verfugbareTage
               WHERE MitarbeiterID = @vacrequest-Antrag_ID
               INTO @DATA(verfugbareTage).
          ENDSELECT.

          IF verfugbareTage < werktage.
            message = NEW zsp_cm_mitarbeiter( textid   = zsp_cm_mitarbeiter=>Urlaubstage_mangel
                                              severity = if_abap_behv_message=>severity-error ).
            APPEND VALUE #( %tky = vacrequest-%tky
                            %msg = message ) TO reported-zsp_r_urlaub.
            APPEND VALUE #( %tky = vacrequest-%tky ) TO failed-zsp_r_urlaub.
          ENDIF.
        ENDLOOP.
     ENDMETHOD.

endclass.
