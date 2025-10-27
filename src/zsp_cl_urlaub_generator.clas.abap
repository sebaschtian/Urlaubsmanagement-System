CLASS zsp_cl_urlaub_generator DEFINITION PUBLIC FINAL CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
ENDCLASS.

CLASS zsp_cl_urlaub_generator IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.
    DATA urlaub TYPE zsp_urlaub_a.
    DATA urlaube TYPE TABLE OF zsp_urlaub_a.

    "Delete Urlaube"
    DELETE FROM ZSP_urlaub_a.
    out->write( |Deleted Urlaube: { sy-dbcnt }| ).

    "Demodaten Urlaube erstellen"
    "Urlaub 1: Hans Meier"
    urlaub-urlaub_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaub-antragsteller = sy-uname.
    urlaub-startdatum = '20220701'.
    urlaub-enddatum = '20220710'.
    urlaub-tage = 8.
    urlaub-genehmigender = sy-uname. "Nicht Sicher"
    urlaub-kommentar = 'Sommerurlaub'.
    urlaub-status = 'G'.
        "Administrative Daten"
        urlaub-last_changed_by = 'GENERATOR'.
        urlaub-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD urlaub-created_at.
        GET TIME STAMP FIELD urlaub-last_changed_at.
    APPEND urlaub TO urlaube.

    "Urlaub 2: Hans Meier"
    urlaub-urlaub_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaub-antragsteller = sy-uname.
    urlaub-startdatum = '20221230'.
    urlaub-enddatum = '20221230'.
    urlaub-tage = 4.
    urlaub-genehmigender = sy-uname. "Nicht Sicher"
    urlaub-kommentar = 'Weihnachtsurlaub'.
    urlaub-status = 'A'.
        "Administrative Daten"
        urlaub-last_changed_by = 'GENERATOR'.
        urlaub-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD urlaub-created_at.
        GET TIME STAMP FIELD urlaub-last_changed_at.
    APPEND urlaub TO urlaube.

    "Urlaub 3: Hans Meier"
    urlaub-urlaub_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaub-antragsteller = sy-uname.
    urlaub-startdatum = '20221227'.
    urlaub-enddatum = '20221230'.
    urlaub-tage = 3.
    urlaub-genehmigender = sy-uname. "Nicht Sicher"
    urlaub-kommentar = 'Weihnachtsurlaub (2. Versuch)'.
    urlaub-status = 'G'.
        "Administrative Daten"
        urlaub-last_changed_by = 'GENERATOR'.
        urlaub-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD urlaub-created_at.
        GET TIME STAMP FIELD urlaub-last_changed_at.
    APPEND urlaub TO urlaube.

    "Urlaub 4: Hans Meier"
    urlaub-urlaub_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaub-antragsteller = sy-uname.
    urlaub-startdatum = '20230527'.
    urlaub-enddatum = '20230614'.
    urlaub-tage = 14.
    urlaub-genehmigender = sy-uname. "Nicht Sicher"
    urlaub-kommentar = ''.
    urlaub-status = 'G'.
        "Administrative Daten"
        urlaub-last_changed_by = 'GENERATOR'.
        urlaub-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD urlaub-created_at.
        GET TIME STAMP FIELD urlaub-last_changed_at.
    APPEND urlaub TO urlaube.

    "Urlaub 5: Hans Maier"
    urlaub-urlaub_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaub-antragsteller = sy-uname.
    urlaub-startdatum = '20231220'.
    urlaub-enddatum = '20231231'.
    urlaub-tage = 8.
    urlaub-genehmigender = sy-uname. "Nicht Sicher"
    urlaub-kommentar = 'Winterurlaub'.
    urlaub-status = 'B'.
        "Administrative Daten"
        urlaub-last_changed_by = 'GENERATOR'.
        urlaub-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD urlaub-created_at.
        GET TIME STAMP FIELD urlaub-last_changed_at.
    APPEND urlaub TO urlaube.

    "Ulaub 6: Petra Schmid"
    urlaub-urlaub_uuid = cl_system_uuid=>create_uuid_x16_static( ).
    urlaub-antragsteller = sy-uname.
    urlaub-startdatum = '20231227'.
    urlaub-enddatum = '20231231'.
    urlaub-tage = 3.
    urlaub-genehmigender = sy-uname. "Nicht Sicher"
    urlaub-kommentar = 'Weihnachtsurlaub'.
    urlaub-status = 'B'.
        "Administrative Daten"
        urlaub-last_changed_by = 'GENERATOR'.
        urlaub-created_by = 'GENERATOR'.
        GET TIME STAMP FIELD urlaub-created_at.
        GET TIME STAMP FIELD urlaub-last_changed_at.
    APPEND urlaub TO urlaube.


    "Urlaube Einfügen"
    INSERT ZSP_urlaub_a FROM TABLE @urlaube.
    out->write( |INSERT Urlaube: { sy-dbcnt }| ).
  ENDMETHOD.
ENDCLASS.
