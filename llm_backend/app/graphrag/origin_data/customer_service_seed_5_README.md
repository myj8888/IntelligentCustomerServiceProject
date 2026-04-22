这是一套按当前项目 `predefined_cypher_dict` 反向构造的最小验证数据。

文件说明：
- `customer_service_seed_5.csv`
  作用：给 GraphRAG 建索引。
  用法：复制到 `llm_backend/app/graphrag/data/input/` 后，使用 `settings_csv.yaml` 建索引。
- `customer_service_seed_5.cypher`
  作用：给 Neo4j 直接导入一套与当前 Cypher 查询字段一致的数据。
  用法：在 Neo4j Browser 或 cypher-shell 中执行。

这套数据特意对齐了这些标签、属性和关系：
- `Product.ProductName`
- `Product.UnitPrice`
- `Product.UnitsInStock`
- `Product.CategoryName`
- `Category.CategoryName`
- `Supplier.CompanyName`
- `Customer.CompanyName`
- `Order.orderId`
- `Order.OrderDate`
- `Order.RequiredDate`
- `Order.ShippedDate`
- `Order.CustomerName`
- `Review.CustomerName`
- `Review.Rating`
- `Review.ReviewText`
- `Review.ReviewDate`
- `(:Product)-[:BELONGS_TO]->(:Category)`
- `(:Product)-[:SUPPLIED_BY]->(:Supplier)`
- `(:Customer)-[:PLACED]->(:Order)`
- `(:Order)-[:CONTAINS {Quantity, UnitPrice}]->(:Product)`
- `(:Review)-[:ABOUT]->(:Product)`
- `(:Employee)-[:PROCESSED]->(:Order)`

导入 Neo4j 后，下面这些问法应该能查到结果：
- `请查询小米智能净水器 Pro 的价格和库存`
- `智能净水器类别下有哪些产品`
- `小米智能家居有限公司提供了哪些产品`
- `创联智能办公有限公司有哪些订单`
- `请查询订单 SO1001 的详情`
- `小米智能净水器 Pro 的评价怎么样`
- `库存低于 10 的产品有哪些`

如果你后续希望我继续，我可以再帮你补一份：
- `neo4j_seed_clear.cypher`
  先清理再导入，适合反复测试。
- `csv -> Neo4j` 的自动导入脚本
  直接从结构化表生成节点和关系。
