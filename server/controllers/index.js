const { connection } = require("../config.db");

const AREA_DETAILS = Object.freeze({
    devops: {
        name: "DevOps",
        description: "Automation, CI/CD, infrastructure, containers, and observability."
    },
    frontend: {
        name: "Frontend",
        description: "Languages, frameworks, and build tools for modern web interfaces."
    },
    backend: {
        name: "Backend",
        description: "Languages, runtimes, frameworks, and databases for server-side applications."
    },
    mobile: {
        name: "Mobile",
        description: "Native and cross-platform tools for building mobile applications."
    },
    cloudops: {
        name: "CloudOps",
        description: "Cloud platforms and operational tools for scalable infrastructure."
    },
    quality_assurance: {
        name: "Quality Assurance",
        description: "Programming, browser automation, and performance testing tools."
    }
});
const TECHNOLOGY_AREAS = Object.freeze(Object.keys(AREA_DETAILS));
const TECHNOLOGY_AREA_SET = new Set(TECHNOLOGY_AREAS);

const queryAllTools = (callback) => {
    connection.query(
        "SELECT tool_id, tool_name FROM tools ORDER BY tool_id",
        callback
    );
};

const queryToolsByArea = (area, callback) => {
    connection.query(
        `SELECT tools.tool_id, tools.tool_name
         FROM ?? AS area_tools
         INNER JOIN tools ON tools.tool_id = area_tools.tool_id
         ORDER BY tools.tool_id`,
        [area],
        callback
    );
};

const sendDatabaseError = (response, error) => {
    console.error("Database query failed:", error);
    response.status(500).json({ error: "Unable to retrieve tools" });
};

const renderError = (response, statusCode, title, message) => {
    response.status(statusCode).render("error", { title, message });
};

const renderDatabaseError = (response, error) => {
    console.error("Database query failed:", error);
    renderError(
        response,
        500,
        "Tools unavailable",
        "The tool catalog could not be loaded. Please try again later."
    );
};

const showTechnologyAreas = (request, response) => {
    const areas = TECHNOLOGY_AREAS.map((id) => ({ id, ...AREA_DETAILS[id] }));
    response.render("index", { title: "Technology Areas", areas });
};

const showToolCatalog = (request, response) => {
    queryAllTools((error, tools) => {
        if (error) {
            return renderDatabaseError(response, error);
        }

        response.render("tools", { title: "Tool Catalog", tools });
    });
};

const showToolsByArea = (request, response) => {
    const areaId = request.params.area;

    if (!TECHNOLOGY_AREA_SET.has(areaId)) {
        return renderError(
            response,
            404,
            "Area not found",
            "The requested technology area does not exist."
        );
    }

    queryToolsByArea(areaId, (error, tools) => {
        if (error) {
            return renderDatabaseError(response, error);
        }

        response.render("area", {
            title: `${AREA_DETAILS[areaId].name} Tools`,
            area: { id: areaId, ...AREA_DETAILS[areaId] },
            tools
        });
    });
};

const listTechnologyAreas = (request, response) => {
    response.status(200).json({ areas: TECHNOLOGY_AREAS });
};

const listTools = (request, response) => {
    queryAllTools((error, results) => {
        if (error) {
            return sendDatabaseError(response, error);
        }

        response.status(200).json({ tools: results });
    });
};

const listToolsByArea = (request, response) => {
    const area = request.params.area;

    if (!TECHNOLOGY_AREA_SET.has(area)) {
        return response.status(404).json({ error: "Technology area not found" });
    }

    queryToolsByArea(area, (error, results) => {
        if (error) {
            return sendDatabaseError(response, error);
        }

        response.status(200).json({ area, tools: results });
    });
};

module.exports = {
    showTechnologyAreas,
    showToolCatalog,
    showToolsByArea,
    listTechnologyAreas,
    listTools,
    listToolsByArea
};
