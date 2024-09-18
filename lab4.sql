-- Q4.1
delete from name
where fips = '51' 

/* It does not work, because we still have VA records in other tables */

4.2
/* No, because no state has fips of 80 */
 
 Key (fips)=(80) is not present in table "name".



