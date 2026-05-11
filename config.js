// Configuration file for startpage
// Users can modify these values to customize their startpage

const CONFIG = {
    // Search engine configuration
    // Available options: "google", "duckduckgo", "bing", "brave"
    search_engine: "google",
    
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
