SELECT person.firstName, person.lastName, address.city, address.state
FROM Person FUll JOIN 
address  ON person.personid = address.personid;