CLASS zcl_pra_mk_enum_mf_status DEFINITION PUBLIC ABSTRACT FINAL.

  PUBLIC SECTION.
    CONSTANTS:
      in_preparation TYPE ZPRA_MF_C_MusicFestivalTP-Status VALUE 'I',
      cancelled      TYPE ZPRA_MF_C_MusicFestivalTP-Status VALUE 'C',
      published      TYPE ZPRA_MF_C_MusicFestivalTP-Status VALUE 'P',
      fully_booked   TYPE ZPRA_MF_C_MusicFestivalTP-Status VALUE 'F'.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_PRA_MK_ENUM_MF_STATUS IMPLEMENTATION.
ENDCLASS.
