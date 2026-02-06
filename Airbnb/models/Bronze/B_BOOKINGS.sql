{% set ngt_bid =3 %}

SELECT booking_id,
       listing_id,
       booking_date,
       {{multi('nights_booked','booking_amount')}}+cleaning_fee+service_fee as TotalAmt,
       booking_status,
        FROM {{source('my_bronze','BOOKINGS')}}
        WHERE NIGHTS_BOOKED>{{ngt_bid}}
