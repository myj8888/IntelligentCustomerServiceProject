MERGE (cat1:Category {CategoryName: '智能净水器'})
SET cat1.Description = '家庭与办公场景使用的智能净水设备'

MERGE (cat2:Category {CategoryName: '智能音箱'})
SET cat2.Description = '支持语音交互和智能家居联动的音箱设备'

MERGE (cat3:Category {CategoryName: '智能照明'})
SET cat3.Description = '支持调光、定时和场景联动的智能灯光设备'

MERGE (sup1:Supplier {CompanyName: '小米智能家居有限公司'})
SET sup1.ContactName = '王磊',
    sup1.Phone = '400-100-1001',
    sup1.Country = '中国'

MERGE (sup2:Supplier {CompanyName: '华为智能终端有限公司'})
SET sup2.ContactName = '李敏',
    sup2.Phone = '400-200-2002',
    sup2.Country = '中国'

MERGE (sup3:Supplier {CompanyName: '美的智能家电有限公司'})
SET sup3.ContactName = '赵欣',
    sup3.Phone = '400-300-3003',
    sup3.Country = '中国'

MERGE (p1:Product {ProductName: '小米智能净水器 Pro'})
SET p1.UnitPrice = '2199.00',
    p1.UnitsInStock = '25',
    p1.CategoryName = '智能净水器'

MERGE (p2:Product {ProductName: '华为智能音箱 Air'})
SET p2.UnitPrice = '399.00',
    p2.UnitsInStock = '48',
    p2.CategoryName = '智能音箱'

MERGE (p3:Product {ProductName: '美的智能灯光套装'})
SET p3.UnitPrice = '699.00',
    p3.UnitsInStock = '8',
    p3.CategoryName = '智能照明'

MERGE (p1)-[:BELONGS_TO]->(cat1)
MERGE (p2)-[:BELONGS_TO]->(cat2)
MERGE (p3)-[:BELONGS_TO]->(cat3)

MERGE (p1)-[:SUPPLIED_BY]->(sup1)
MERGE (p2)-[:SUPPLIED_BY]->(sup2)
MERGE (p3)-[:SUPPLIED_BY]->(sup3)

MERGE (cust1:Customer {CompanyName: '创联智能办公有限公司'})
SET cust1.ContactName = '陈晨',
    cust1.Phone = '021-88886666',
    cust1.Country = '中国'

MERGE (emp1:Employee {FirstName: '伟', LastName: '张'})
SET emp1.Title = '客户服务专员',
    emp1.HireDate = '2022-06-01'

MERGE (ship1:Shipper {CompanyName: '顺丰速运'})
SET ship1.Phone = '95338'

MERGE (o1:Order {orderId: 'SO1001'})
SET o1.OrderDate = '2025-03-01',
    o1.RequiredDate = '2025-03-05',
    o1.ShippedDate = '2025-03-03',
    o1.CustomerName = '创联智能办公有限公司'

MERGE (cust1)-[:PLACED]->(o1)
MERGE (emp1)-[:PROCESSED]->(o1)
MERGE (o1)-[:SHIPPED_VIA]->(ship1)

MERGE (o1)-[c1:CONTAINS]->(p1)
SET c1.Quantity = '2',
    c1.UnitPrice = '2199.00'

MERGE (o1)-[c2:CONTAINS]->(p2)
SET c2.Quantity = '1',
    c2.UnitPrice = '399.00'

MERGE (r1:Review {ReviewId: 'R1001'})
SET r1.CustomerName = '创联智能办公有限公司',
    r1.Rating = '4.8',
    r1.ReviewText = '净水效果很好，安装后出水稳定，APP 提醒也很及时。',
    r1.ReviewDate = '2025-03-06'

MERGE (r2:Review {ReviewId: 'R1002'})
SET r2.CustomerName = '创联智能办公有限公司',
    r2.Rating = '4.6',
    r2.ReviewText = '识别语音很快，会议室控制灯光很方便。',
    r2.ReviewDate = '2025-03-06'

MERGE (r3:Review {ReviewId: 'R1003'})
SET r3.CustomerName = '创联智能办公有限公司',
    r3.Rating = '4.2',
    r3.ReviewText = '联动效果不错，不过第一次配网需要多试一次。',
    r3.ReviewDate = '2025-03-07'

MERGE (cust1)-[:WROTE]->(r1)
MERGE (cust1)-[:WROTE]->(r2)
MERGE (cust1)-[:WROTE]->(r3)

MERGE (r1)-[:ABOUT]->(p1)
MERGE (r2)-[:ABOUT]->(p2)
MERGE (r3)-[:ABOUT]->(p3)
