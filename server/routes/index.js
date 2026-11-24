const express = require("express");
const {
    showTechnologyAreas,
    showToolCatalog,
    showToolsByArea,
    listTechnologyAreas,
    listTools,
    listToolsByArea
} = require("../controllers/index");

const router = express.Router();

// HTML pages
router.get("/", showTechnologyAreas);
router.get("/catalog", showToolCatalog);
router.get("/areas/:area", showToolsByArea);

// JSON endpoints
router.get("/areas", listTechnologyAreas);
router.get("/areas/:area/tools", listToolsByArea);
router.get("/tools", listTools);

module.exports = router;
