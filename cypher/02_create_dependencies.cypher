// ============================================================
// Global Student Portal — Component Dependency Graph
// Step 2: Create DEPENDS_ON relationships
//
// Direction: (A)-[:DEPENDS_ON]->(B) means A depends on B
// ============================================================

// --- Client → Edge ---
MATCH (a:Component {name: 'Web Client'}),       (b:Component {name: 'CloudFlare CDN'})       CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Mobile Client'}),     (b:Component {name: 'CloudFlare CDN'})       CREATE (a)-[:DEPENDS_ON]->(b);

// --- Edge → Infrastructure ---
MATCH (a:Component {name: 'CloudFlare CDN'}),    (b:Component {name: 'GeoDNS Load Balancer'}) CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'GeoDNS Load Balancer'}), (b:Component {name: 'Nginx'})             CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Nginx'}),             (b:Component {name: 'Kong API Gateway'})     CREATE (a)-[:DEPENDS_ON]->(b);

// --- API Gateway → Microservices ---
MATCH (a:Component {name: 'Kong API Gateway'}),  (b:Component {name: 'Auth Service'})          CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Kong API Gateway'}),  (b:Component {name: 'Student Service'})       CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Kong API Gateway'}),  (b:Component {name: 'Schedule Service'})      CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Kong API Gateway'}),  (b:Component {name: 'Grades Service'})        CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Kong API Gateway'}),  (b:Component {name: 'Registration Service'})  CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Kong API Gateway'}),  (b:Component {name: 'Notification Service'})  CREATE (a)-[:DEPENDS_ON]->(b);

// --- Microservices → Data Layer ---
// Auth Service
MATCH (a:Component {name: 'Auth Service'}),          (b:Component {name: 'Cassandra'}) CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Auth Service'}),          (b:Component {name: 'Redis'})     CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Auth Service'}),          (b:Component {name: 'Kafka'})     CREATE (a)-[:DEPENDS_ON]->(b);

// Student Service
MATCH (a:Component {name: 'Student Service'}),       (b:Component {name: 'Cassandra'}) CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Student Service'}),       (b:Component {name: 'Redis'})     CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Student Service'}),       (b:Component {name: 'Kafka'})     CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Student Service'}),       (b:Component {name: 'S3'})        CREATE (a)-[:DEPENDS_ON]->(b);

// Schedule Service
MATCH (a:Component {name: 'Schedule Service'}),      (b:Component {name: 'Cassandra'}) CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Schedule Service'}),      (b:Component {name: 'Redis'})     CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Schedule Service'}),      (b:Component {name: 'Kafka'})     CREATE (a)-[:DEPENDS_ON]->(b);

// Grades Service
MATCH (a:Component {name: 'Grades Service'}),        (b:Component {name: 'Cassandra'}) CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Grades Service'}),        (b:Component {name: 'Redis'})     CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Grades Service'}),        (b:Component {name: 'Kafka'})     CREATE (a)-[:DEPENDS_ON]->(b);

// Registration Service
MATCH (a:Component {name: 'Registration Service'}),  (b:Component {name: 'Cassandra'}) CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Registration Service'}),  (b:Component {name: 'Redis'})     CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Registration Service'}),  (b:Component {name: 'Kafka'})     CREATE (a)-[:DEPENDS_ON]->(b);

// Notification Service
MATCH (a:Component {name: 'Notification Service'}),  (b:Component {name: 'Kafka'})     CREATE (a)-[:DEPENDS_ON]->(b);
MATCH (a:Component {name: 'Notification Service'}),  (b:Component {name: 'Redis'})     CREATE (a)-[:DEPENDS_ON]->(b);
