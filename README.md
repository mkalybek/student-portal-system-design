# Global Student Portal — Dependency Graph & Stability Metrics

Component dependency analysis of a multi-tenant student portal using Neo4j graph database and Robert C. Martin's stability metrics from *Clean Architecture*.

## Architecture Overview

16 components across 5 layers: clients → edge → infrastructure → microservices → data/messaging. Full architecture in [ARCHITECTURE.md](ARCHITECTURE.md).

## Quick Start

### 1. Start Neo4j

```bash
docker compose up -d
```

Open Neo4j Browser at http://localhost:7474 (credentials: `neo4j` / `changeme123`).

### 2. Load the Graph

Run the Cypher scripts in order in Neo4j Browser (or via `cypher-shell`):

```bash
# Using cypher-shell
cat cypher/01_create_components.cypher | cypher-shell -u neo4j -p changeme123
cat cypher/02_create_dependencies.cypher | cypher-shell -u neo4j -p changeme123
```

### 3. Calculate Stability Metrics

```bash
cat cypher/03_stability_metrics.cypher | cypher-shell -u neo4j -p changeme123
```

Results are also pre-computed in [STABILITY_METRICS.md](STABILITY_METRICS.md).

### 4. Visualize the Graph

In Neo4j Browser, run:

```cypher
MATCH (a)-[r:DEPENDS_ON]->(b) RETURN a, r, b;
```

## Project Structure

```
├── ARCHITECTURE.md           # System design document
├── STABILITY_METRICS.md      # Stability metrics table & interpretation
├── docker-compose.yml        # Neo4j setup
├── cypher/
│   ├── 01_create_components.cypher    # Node creation
│   ├── 02_create_dependencies.cypher  # Relationship creation
│   └── 03_stability_metrics.cypher    # Fan-in, Fan-out, Instability query
└── README.md
```

## Stability Metrics (Robert C. Martin)

| Metric   | Formula                           | Description                         |
|----------|-----------------------------------|-------------------------------------|
| Fan-in   | count of incoming `DEPENDS_ON`    | How many components depend on me    |
| Fan-out  | count of outgoing `DEPENDS_ON`    | How many components I depend on     |
| I        | Fan-out / (Fan-in + Fan-out)      | 0 = stable, 1 = unstable           |

Key findings:
- **Data layer (I=0)** — maximally stable, everything depends on it
- **Clients (I=1)** — maximally unstable, easy to change
- **Microservices (I≈0.75)** — appropriately unstable per Clean Architecture

## Sandbox Neo4j

If using Neo4j Sandbox (sandbox.neo4j.com) instead of Docker:
1. Create a blank sandbox
2. Use the Bolt URL and credentials from the sandbox dashboard
3. Run the same Cypher scripts from `cypher/` directory

## Cleanup

```bash
docker compose down -v
```
