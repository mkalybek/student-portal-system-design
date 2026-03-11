// ============================================================
// Global Student Portal — Stability Metrics Query
//
// Based on Robert C. Martin's "Clean Architecture":
//   Fan-in  = number of incoming dependencies (who depends on me)
//   Fan-out = number of outgoing dependencies (who do I depend on)
//   I (Instability) = Fan-out / (Fan-in + Fan-out)
//
//   I = 0  → maximally stable   (many dependents, no dependencies)
//   I = 1  → maximally unstable (no dependents, only dependencies)
// ============================================================

MATCH (c:Component)
OPTIONAL MATCH (c)<-[:DEPENDS_ON]-(dependent)
WITH c, count(dependent) AS fan_in
OPTIONAL MATCH (c)-[:DEPENDS_ON]->(dependency)
WITH c, fan_in, count(dependency) AS fan_out
RETURN
  c.name      AS Component,
  c.layer     AS Layer,
  fan_in      AS Fan_In,
  fan_out     AS Fan_Out,
  CASE WHEN (fan_in + fan_out) = 0 THEN 0.0
       ELSE round(toFloat(fan_out) / (fan_in + fan_out) * 1000) / 1000
  END         AS Instability
ORDER BY Instability ASC, Component;
