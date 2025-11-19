CLASS zsp_cl_urlaub_generator_1 DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zsp_cl_urlaub_generator_1 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA urlaub TYPE zsp_urlaub_a.
    DATA urlaube TYPE TABLE OF zsp_urlaub_a.
    data antrag type zsp_antrag_a.
    data antraege type table of zsp_antrag_a.

    "Delete Urlaube"
    DELETE FROM ZSP_urlaub_a.
    out->write( |Deleted Urlaube: { sy-dbcnt }| ).

    "Delete Anträge"
    delete from zsp_antrag_a.
    out->write( |Deleted Antraege: { sy-dbcnt }| ).

    "Demodaten Urlaubanspruch erstellen"
    "Urlaub 1: Hans Meier 2022"
    urlaub-urlaub_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaub-antragsteller = sy-uname.
    urlaub-mitarbeiter = 'Hans Meier'.
    urlaub-jahr = '2022'.
    urlaub-urlaubstage = 30.
        "Administrative Daten"
        urlaub-last_changed_by = 'GENERATOR'.
        urlaub-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD urlaub-created_at.
        GET TIME STAMP FIELD urlaub-last_changed_at.
    APPEND urlaub TO urlaube.

    "Antrag 1: Hans Meier"
    antrag-antrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    antrag-antragsteller = sy-uname.
    antrag-startdatum = '20220701'.
    antrag-enddatum = '20220710'.
    antrag-tage = 8.
    antrag-genehmigender = sy-uname. "Nicht Sicher"
    antrag-kommentar = 'Sommerurlaub'.
    antrag-status = 'G'.
        "Administrative Daten"
        antrag-last_changed_by = 'GENERATOR'.
        antrag-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD antrag-created_at.
        GET TIME STAMP FIELD antrag-last_changed_at.
    APPEND antrag TO antraege.

    "Antrag 2: Hans Meier"
    antrag-antrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    antrag-antragsteller = sy-uname.
    antrag-startdatum = '20221227'.
    antrag-enddatum = '20221230'.
    antrag-tage = 4.
    antrag-genehmigender = sy-uname. "Nicht Sicher"
    antrag-kommentar = 'Weihnachtsurlaub'.
    antrag-status = 'A'.
        "Administrative Daten"
        antrag-last_changed_by = 'GENERATOR'.
        antrag-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD antrag-created_at.
        GET TIME STAMP FIELD antrag-last_changed_at.
    APPEND antrag TO antraege.

    "Antrag 3: Hans Meier"
    antrag-antrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    antrag-antragsteller = sy-uname.
    antrag-startdatum = '20221228'.
    antrag-enddatum = '20221230'.
    antrag-tage = 3.
    antrag-genehmigender = sy-uname. "Nicht Sicher"
    antrag-kommentar = 'Weihnachtsurlaub (2. Versuch)'.
    antrag-status = 'G'.
        "Administrative Daten"
        antrag-last_changed_by = 'GENERATOR'.
        antrag-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD antrag-created_at.
        GET TIME STAMP FIELD antrag-last_changed_at.
    APPEND antrag TO antraege.

    "Urlaub 2: Hans Meier 2023"
    urlaub-urlaub_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaub-antragsteller = sy-uname.
    urlaub-mitarbeiter = 'Hans Meier'.
    urlaub-jahr = '2023'.
    urlaub-urlaubstage = 30.
        "Administrative Daten"
        urlaub-last_changed_by = 'GENERATOR'.
        urlaub-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD urlaub-created_at.
        GET TIME STAMP FIELD urlaub-last_changed_at.
    APPEND urlaub TO urlaube.

    "Antrag 4: Hans Meier"
    antrag-antrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    antrag-antragsteller = sy-uname.
    antrag-startdatum = '20230527'.
    antrag-enddatum = '20230614'.
    antrag-tage = 14.
    antrag-genehmigender = sy-uname. "Nicht Sicher"
    antrag-kommentar = ''.
    antrag-status = 'G'.
        "Administrative Daten"
        antrag-last_changed_by = 'GENERATOR'.
        antrag-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD antrag-created_at.
        GET TIME STAMP FIELD antrag-last_changed_at.
    APPEND antrag TO antraege.

    "Antrag 5: Hans Meier"
    antrag-antrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    antrag-antragsteller = sy-uname.
    antrag-startdatum = '20231220'.
    antrag-enddatum = '20231231'.
    antrag-tage = 8.
    antrag-genehmigender = sy-uname. "Nicht Sicher"
    antrag-kommentar = 'Winterurlaub'.
    antrag-status = 'B'.
        "Administrative Daten"
        antrag-last_changed_by = 'GENERATOR'.
        antrag-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD antrag-created_at.
        GET TIME STAMP FIELD antrag-last_changed_at.
    APPEND antrag TO antraege.

    "Urlaub 3: Lisa Müller 2023"
    urlaub-urlaub_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaub-antragsteller = sy-uname.
    urlaub-mitarbeiter = 'Lisa Müller'.
    urlaub-jahr = '2023'.
    urlaub-urlaubstage = 30.
        "Administrative Daten"
        urlaub-last_changed_by = 'GENERATOR'.
        urlaub-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD urlaub-created_at.
        GET TIME STAMP FIELD urlaub-last_changed_at.
    APPEND urlaub TO urlaube.

    "Urlaub 4: Petra Schmid"
    urlaub-urlaub_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaub-antragsteller = sy-uname.
    urlaub-mitarbeiter = 'Petra Schmid'.
    urlaub-jahr = '2023'.
    urlaub-urlaubstage = 7.
        "Administrative Daten"
        urlaub-last_changed_by = 'GENERATOR'.
        urlaub-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD urlaub-created_at.
        GET TIME STAMP FIELD urlaub-last_changed_at.
    APPEND urlaub TO urlaube.

    "Antrag 6: Petra Schmid"
    antrag-antrag_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    antrag-antragsteller = sy-uname.
    antrag-startdatum = '20231227'.
    antrag-enddatum = '20231231'.
    antrag-tage = 3.
    antrag-genehmigender = sy-uname. "Nicht Sicher"
    antrag-kommentar = 'Weihnachtsurlaub'.
    antrag-status = 'B'.
        "Administrative Daten"
        antrag-last_changed_by = 'GENERATOR'.
        antrag-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD antrag-created_at.
        GET TIME STAMP FIELD antrag-last_changed_at.
    APPEND antrag TO antraege.


    "Urlaube Einfügen"
    INSERT ZSP_urlaub_a FROM TABLE @urlaube.
    out->write( |INSERT Urlaube: { sy-dbcnt }| ).

    "Anträge einfügen"
    insert zsp_antrag_a from table @antraege.
    out->write( |insert Antraege: { sy-dbcnt }| ).
  ENDMETHOD.
ENDCLASS.

