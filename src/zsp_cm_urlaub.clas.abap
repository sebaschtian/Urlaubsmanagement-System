CLASS zsp_cm_urlaub DEFINITION PUBLIC
INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_abap_behv_message.
    INTERFACES if_t100_message.
    INTERFACES if_t100_dyn_msg.

    CONSTANTS:
      BEGIN OF test_message,
        msid  TYPE symsgid VALUE 'ZSP_Urlaub',
        msgno TYPE symsgno VALUE '001',
        attr1 TYPE scx_attrname VALUE 'USER_NAME',
        attr2 TYPE scx_attrname VALUE '',
        attr3 TYPE scx_attrname VALUE '',
        attr4 TYPE scx_attrname VALUE '',
      END OF test_message.

      data user_name type syuname.

      methods constructor
        importing
          severity type if_abap_behv_message=>t_severity default if_abap_behv_message=>severity-error
          textid like if_t100_message=>t100key default if_t100_message=>default_textid
          !previous like previous optional
          user_name type syuname optional.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zsp_cm_urlaub IMPLEMENTATION.

method constructor ##ADT_SUPPRESS_GENERATION.
    super->constructor( previous = previous ).

    if_t100_message~t100key = textid.
    if_abap_behv_message~m_severity = severity.
    me->user_name = user_name.

endmethod.

ENDCLASS.




