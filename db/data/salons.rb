def seed_salons
  Salon.create(company_name: 'Salon1', PAN_no: 'QWERT1234U',address:"1231, ASD Colony,Sec 1",total_chairs: 4)
  Salon.create(company_name: 'Salon2', PAN_no: 'QWERT1235U',address:"1232, ASD Colony,Sec 2",total_chairs: 12)
  Salon.create(company_name: 'Salon3', PAN_no: 'QWERT1236U',address:"1233, ASD Colony,Sec 3",total_chairs: 2)
  Salon.create(company_name: 'Salon4', PAN_no: 'QWERT1237U',address:"1234, ASD Colony,Sec 4",total_chairs: 7)
  Salon.create(company_name: 'Salon5', PAN_no: 'QWERT1238U',address:"1235, ASD Colony,Sec 5",total_chairs: 3)
end