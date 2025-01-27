CLASS zbp_generate_bookings_998 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
  INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbp_generate_bookings_998 IMPLEMENTATION.
 METHOD if_oo_adt_classrun~main.
    DATA:it_bookings TYPE TABLE OF ztbooking_998.

*    Lee la marca de tiempo actual
    GET TIME STAMP FIELD DATA(zv_tsl).
*   Llena la tabla
    it_bookings = VALUE #(
        ( booking  = '1' customername = 'Buchholm' numberofpassengers = '3' emailaddress = 'tester1@flight.example.com'
          country = 'Germany' dateofbooking = '20180213125959' dateoftravel = '20180213125959' cost = '546' currencycode = 'EUR' lastchangedat = zv_tsl )
        ( booking  = '2' customername = 'Jeremias' numberofpassengers = '1' emailaddress = 'tester2@flight.example.com'
          country = 'USA' dateofbooking = '20180313125959' dateoftravel = '20180313125959' cost = '1373' currencycode = 'USD' lastchangedat = zv_tsl )
     ).

*   Elimina las posibles entradas en la base de datos cuando mya está llena
    DELETE FROM ztbooking_998.
*   Inserta nuevas entradas en la tabla
    INSERT ztbooking_998 FROM TABLE @it_bookings.

*   Comprueba el resultado
    SELECT * FROM ztbooking_998 INTO TABLE @it_bookings.
    out->write( sy-dbcnt ).
    out->write( 'data inserted successfully!' ).

  ENDMETHOD.












ENDCLASS.
