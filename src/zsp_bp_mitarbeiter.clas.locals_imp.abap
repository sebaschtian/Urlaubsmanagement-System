*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lhc_mitarbeiter DEFINITION INHERITING FROM cl_abap_behavior_handler.
    PRIVATE SECTION.
        methods get_instance_authorizations for instance authorization
            importing keys request requested_authorizations for Mitarbeiter result result.
endclass.

class lhc_mitarbeiter IMPLEMENTATION.
    method get_instance_authorizations.
    ENDMETHOD.
endclass.
