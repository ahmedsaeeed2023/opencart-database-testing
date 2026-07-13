use  opencart_db;

-- TC-CAT-001 Verify Category Added Successfully
SELECT *
FROM oc_category c
INNER JOIN oc_category_description cd
ON c.category_id = cd.category_id
WHERE cd.name = 'Electronics';

-- TC-CAT-002 Verify Main Category has no Parent
select c.parent_id , cd.name
from oc_category c 
inner join oc_category_description cd
on c.category_id=cd.category_id
where name='Fashion';

-- TC-CAT-003 Verify Subcategory Parent Assignment
select c.category_id, c.parent_id , cd.name
from oc_category c 
inner join oc_category_description cd
on c.category_id=cd.category_id
where name='Mobile';

-- TC-CAT-004 Verify Disabled Category Status
select c.status, cd.name
from oc_category c 
inner join oc_category_description cd
on c.category_id=cd.category_id
where name='TestDisable';

-- TC-CAT-005 Verify Auto Increment Category ID
select c.category_id
from oc_category c 
order by category_id desc limit 1;

-- TC-CAT-006 Verify Category Image Storage
select c.image , c.category_id
from oc_category c 
order by category_id desc limit 1;

-- TC-CAT-007 Verify No Duplicate Categories
SELECT name, COUNT(*) total 
FROM oc_category_description 
GROUP BY name HAVING COUNT(*) > 1;

-- TC-CAT-008 Verify Category Description Exists
SELECT c.category_id FROM oc_category c 
LEFT JOIN oc_category_description cd 
ON c.category_id = cd.category_id 
WHERE cd.category_id IS NULL;

-- TC-PROD-009 Verify product cannot be saved without model
SELECT * from oc_product where model = '';

-- TC-PROD-010 Verify product must have name
SELECT * from oc_product_description where name = '';

-- TC-PROD-011 Verify price cannot be negative
SELECT price from oc_product where price <0;

-- TC-PROD-012 Verify SKU must be unique
update oc_product 
set sku = 'test_sku'
where product_id in (28,35);
SELECT sku, COUNT(*)
FROM oc_product
GROUP BY sku
HAVING COUNT(*) > 1;

-- TC-PROD-013 Verify name change at UI
update oc_product_description 
set name = 'testNewNameAtUI'
where product_id =51;

-- TC-PROD-014	Verify status accepts only 0 or 1
update oc_product 
set	status = 3
where product_id in (30,33);
SELECT product_id ,status FROM oc_product WHERE status NOT IN (0,1);

-- TC-PROD-015	Verify invalid language_id is not allowed
update oc_product_description 
set	language_id = 999
where product_id in (30,33);
SELECT * FROM oc_product_description WHERE language_id = 999;

-- TC-PROD-016	Verify product cannot be created without price
SELECT * FROM oc_product WHERE price in (0,null);

-- TC-PROD-017	Verify orphan products do not exist
SELECT p.product_id FROM oc_product p 
LEFT JOIN oc_product_description pd 
ON p.product_id = pd.product_id 
WHERE pd.product_id IS NULL;





