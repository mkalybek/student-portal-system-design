// ============================================================
// Global Student Portal — Component Dependency Graph
// Step 1: Create component nodes
// ============================================================

// --- Clients ---
CREATE (:Component {name: 'Web Client',           layer: 'client',         tech: 'React'});
CREATE (:Component {name: 'Mobile Client',         layer: 'client',         tech: 'React Native'});

// --- Edge / Infrastructure ---
CREATE (:Component {name: 'CloudFlare CDN',        layer: 'edge',           tech: 'CloudFlare'});
CREATE (:Component {name: 'GeoDNS Load Balancer',  layer: 'edge',           tech: 'GeoDNS'});
CREATE (:Component {name: 'Nginx',                 layer: 'infrastructure', tech: 'Nginx'});
CREATE (:Component {name: 'Kong API Gateway',      layer: 'infrastructure', tech: 'Kong'});

// --- Microservices ---
CREATE (:Component {name: 'Auth Service',          layer: 'service',        tech: 'SSO/SAML'});
CREATE (:Component {name: 'Student Service',       layer: 'service',        tech: 'Microservice'});
CREATE (:Component {name: 'Schedule Service',      layer: 'service',        tech: 'Microservice'});
CREATE (:Component {name: 'Grades Service',        layer: 'service',        tech: 'Microservice'});
CREATE (:Component {name: 'Registration Service',  layer: 'service',        tech: 'Microservice'});
CREATE (:Component {name: 'Notification Service',  layer: 'service',        tech: 'Microservice'});

// --- Data / Messaging ---
CREATE (:Component {name: 'Kafka',                 layer: 'messaging',      tech: 'Apache Kafka'});
CREATE (:Component {name: 'Cassandra',             layer: 'data',           tech: 'Apache Cassandra'});
CREATE (:Component {name: 'Redis',                 layer: 'data',           tech: 'Redis'});
CREATE (:Component {name: 'S3',                    layer: 'data',           tech: 'AWS S3'});
