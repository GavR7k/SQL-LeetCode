SELECT person.firstName, person.lastName, address.city, address.state
FROM Person 
LEFT JOIN 
Address  ON person.personid = address.personid;
