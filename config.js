// Configuration file for startpage
// Users can modify these values to customize their startpage

const CONFIG = {
    // Search engine configuration
    // Available options: "google", "duckduckgo", "bing", "brave"
    search_engine: "google",

    // Timezone for clock display (IANA timezone string)
    // Used to correctly display local time in browsers that spoof timezone (e.g. LibreWolf)
    // Common values:
    //   America/New_York, America/Chicago, America/Denver, America/Los_Angeles
    //   Europe/London, Europe/Paris, Europe/Berlin, Asia/Tokyo
    // Find yours at https://en.wikipedia.org/wiki/List_of_tz_database_time_zones
    timezone: "America/New_York",
    
    // Links configuration
    // Format: { text: "Display Text", url: "https://example.com" }
    links: [
        { text: "mail", url: "https://inbox.google.com/" },
        { text: "github", url: "https://github.com/" },
        { text: "fileditch", url: "https://new.fileditch.com/" },
        { text: "wallhaven", url: "https://wallhaven.cc" },
        { text: "pastebin", url: "https://pastebin.com" },
        { text: "omarchy", url: "https://omarchy.org" }
    ]
};

// Search engine URLs
const SEARCH_ENGINES = {
    google: "https://www.google.com/search",
    duckduckgo: "https://duckduckgo.com/",
    bing: "https://www.bing.com/search",
    brave: "https://search.brave.com/search"
};
