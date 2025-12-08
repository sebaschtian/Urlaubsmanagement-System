CLASS zsp_cm_mitarbeiter DEFINITION PUBLIC
  INHERITING FROM cx_static_check FINAL CREATE PUBLIC .

  PUBLIC SECTION.
    "Interfaces"
    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    "Constants"
    CONSTANTS:
        BEGIN OF Urlaubstage_mangel,
            msgid type symsgid value 'zsp_urlaub',
            msgno type symsgno value '001',
            attr1 type scx_attrname value 'Comment',
            attr2 type scx_attrname value '',
            attr3 type scx_attrname value '',
            attr4 type scx_attrname value '',
        END OF Urlaubstage_mangel.

    CONSTANTS:
        BEGIN OF EndeVorStart,
            msgid type symsgid value 'zsp_urlaub',
            msgno type symsgno value '002',
            attr1 type scx_attrname value 'Comment',
            attr2 type scx_attrname value '',
            attr3 type scx_attrname value '',
            attr4 type scx_attrname value '',
        END OF ENDEVORSTART.

    CONSTANTS:
        BEGIN OF Datum_verpasst,
            msgid type symsgid value 'zsp_urlaub',
            msgno type symsgno value '005',
            attr1 type scx_attrname value 'Comment',
            attr2 type scx_attrname value '',
            attr3 type scx_attrname value '',
            attr4 type scx_attrname value '',
        END OF DATUM_VERPASST.

    CONSTANTS:
        BEGIN OF Bereits_Abgelehnt,
            msgid type symsgid value 'zsp_urlaub',
            msgno type symsgno value '003',
            attr1 type scx_attrname value 'Comment',
            attr2 type scx_attrname value '',
            attr3 type scx_attrname value '',
            attr4 type scx_attrname value '',
        END OF Bereits_Abgelehnt.

    CONSTANTS:
        BEGIN OF Bereits_Zugestimmt,
            msgid type symsgid value 'zsp_urlaub',
            msgno type symsgno value '004',
            attr1 type scx_attrname value 'Comment',
            attr2 type scx_attrname value '',
            attr3 type scx_attrname value '',
            attr4 type scx_attrname value '',
        END OF Bereits_Zugestimmt.


    "Attribute
    DATA Comment TYPE STRING.

    "Constructor
    METHODS constructor
        IMPORTING severity TYPE if_abap_behv_message=>t_severity DEFAULT if_abap_behv_message=>severity-error
                  textid LIKE if_t100_message=>t100key DEFAULT if_t100_message=>default_textid
                  !previous LIKE previous OPTIONAL
                  Comment TYPe zsp_comment OPTIONAL.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsp_cm_mitarbeiter IMPLEMENTATION.

    METHOD constructor ##ADT_SUPPRESS_GENERATION.
        super->constructor( previous = previous ).

        if_t100_message~t100key = textid.
        if_abap_behv_message~m_severity = severity.
        me->comment = comment.
    ENDMETHOD.
ENDCLASS.




