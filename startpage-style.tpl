/* Reset and base styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* Import omarchy theme colors */
@import url("~/.config/omarchy/current/theme/colors.css");

/* Color palette variables - using CSS custom properties that reference imported omarchy colors */
:root {
    --accent: @accent;
    --cursor: @cursor;
    --foreground: @foreground;
    --background: @background;
    --selection-foreground: @selection_foreground;
    --selection-background: @selection_background;
    --color0: @color0;
    --color1: @color1;
    --color2: @color2;
    --color3: @color3;
    --color4: @color4;
    --color5: @color5;
    --color6: @color6;
    --color7: @color7;
    --color8: @color8;
    --color9: @color9;
    --color10: @color10;
    --color11: @color11;
    --color12: @color12;
    --color13: @color13;
    --color14: @color14;
    --color15: @color15;
}

body {
    font-family: 'JetBrains Mono', monospace;
    background: var(--background);
    color: var(--foreground);
    min-height: 100vh;
    display: flex;
    justify-content: center;
    align-items: center;
    overflow: hidden;
    position: relative;
}

/* Matrix rain background */
.matrix-bg {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -1;
    opacity: 0.4;
    pointer-events: none;
}

/* Terminal container */
.terminal-container {
    width: 90%;
    max-width: 800px;
    background: rgba(var(--background-rgb), 0.45);
    backdrop-filter: blur(10px);
    border: 2px solid var(--accent);
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 
        0 0 30px rgba(var(--accent-rgb), 0.3),
        inset 0 0 30px rgba(var(--accent-rgb), 0.1);
    animation: terminalGlow 3s ease-in-out infinite alternate;
}

@keyframes terminalGlow {
    0% {
        box-shadow: 
            0 0 30px rgba(var(--accent-rgb), 0.3),
            inset 0 0 30px rgba(var(--accent-rgb), 0.1);
    }
    100% {
        box-shadow: 
            0 0 50px rgba(var(--accent-rgb), 0.5),
            inset 0 0 50px rgba(var(--accent-rgb), 0.2);
    }
}

/* Terminal header */
.terminal-header {
    background: linear-gradient(90deg, rgba(var(--accent-rgb), 0.1), rgba(var(--color4-rgb), 0.1));
    backdrop-filter: blur(5px);
    padding: 12px 16px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-bottom: 1px solid var(--accent);
}

.terminal-title {
    color: var(--foreground);
    font-size: 14px;
    font-weight: 700;
    text-shadow: 0 0 10px var(--accent);
    display: flex;
    align-items: center;
    gap: 8px;
}

.terminal-title::before {
    content: '>';
    color: var(--accent);
    animation: blink 2s infinite;
}

.terminal-status {
    display: flex;
    align-items: center;
    gap: 6px;
}

.status-dot {
    width: 8px;
    height: 8px;
    border-radius: 50%;
    animation: pulse 2s infinite;
}

.status-dot.online {
    background: var(--color10);
    box-shadow: 0 0 10px var(--color10);
}

.status-dot.processing {
    background: var(--color11);
    box-shadow: 0 0 10px var(--color11);
}

.status-dot.scanning {
    background: var(--color13);
    box-shadow: 0 0 10px var(--color13);
}

.status-text {
    color: var(--color7);
    font-size: 12px;
    font-weight: 400;
    letter-spacing: 1px;
}

@keyframes pulse {
    0%, 100% { opacity: 1; transform: scale(1); }
    50% { opacity: 0.7; transform: scale(1.2); }
}

/* Terminal body */
.terminal-body {
    padding: 30px;
    background: rgba(var(--background-rgb), 0.45);
    backdrop-filter: blur(5px);
    min-height: 500px;
}

/* ASCII art */
.ascii-art {
    text-align: center;
    margin-bottom: 20px;
    color: var(--accent);
    font-size: 12px;
    line-height: 1.2;
    text-shadow: 0 0 10px var(--accent);
    animation: asciiPulse 2s ease-in-out infinite;
}

@keyframes asciiPulse {
    0%, 100% { opacity: 0.8; }
    50% { opacity: 1; }
}

/* Time display */
.time-display {
    text-align: center;
    margin-bottom: 30px;
    border: 1px solid var(--accent);
    border-radius: 4px;
    padding: 15px;
    background: rgba(var(--accent-rgb), 0.05);
    backdrop-filter: blur(10px);
}

.time-text {
    display: block;
    font-size: 2.5em;
    font-weight: 700;
    color: var(--accent);
    text-shadow: 0 0 20px var(--accent);
    margin-bottom: 5px;
    font-family: 'Space Grotesk', sans-serif;
}

.date-text {
    font-size: 1em;
    color: var(--color7);
    opacity: 0.8;
}

/* Search container */
.search-container {
    margin-bottom: 30px;
}

.search-input-wrapper {
    display: flex;
    align-items: center;
    background: var(--selection-foreground);
    border: 2px solid var(--accent);
    border-radius: 4px;
    padding: 12px 16px;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
}

.search-input-wrapper:focus-within {
    border-color: var(--color10);
    box-shadow: 0 0 20px rgba(168, 125, 255, 0.5);
}

.prompt {
    color: var(--accent);
    font-weight: 700;
    margin-right: 10px;
    font-size: 1.2em;
}

.search-input {
    background: transparent;
    border: none;
    color: var(--foreground);
    font-family: 'JetBrains Mono', monospace;
    font-size: 16px;
    outline: none;
    flex: 1;
    caret-color: var(--accent);
}

.search-input::placeholder {
    color: var(--color8);
    opacity: 0.6;
}

.cursor {
    width: 2px;
    height: 20px;
    background: var(--accent);
    animation: blink 1s infinite;
    margin-left: 2px;
}

@keyframes blink {
    0%, 50% { opacity: 1; }
    51%, 100% { opacity: 0; }
}

/* Links container */
.links-container {
    margin-bottom: 30px;
}

.links-header {
    color: var(--accent);
    font-weight: 700;
    margin-bottom: 15px;
    text-transform: uppercase;
    font-size: 0.9em;
    letter-spacing: 2px;
    text-shadow: 0 0 10px var(--accent);
}

.links-grid {
    display: grid;
    grid-template-columns: repeat(auto-fit, minmax(150px, 1fr));
    gap: 12px;
}

.link-item {
    display: flex;
    align-items: center;
    padding: 12px 16px;
    background: rgba(var(--accent-rgb), 0.05);
    border: 1px solid var(--color4);
    border-radius: 4px;
    text-decoration: none;
    color: var(--foreground);
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
}

.link-item::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, var(--accent), transparent);
    transition: left 0.5s ease;
}

.link-item:hover::before {
    left: 100%;
}

.link-item:hover {
    background: rgba(var(--accent-rgb), 0.15);
    border-color: var(--accent);
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(var(--accent-rgb), 0.3);
}

.link-icon {
    margin-right: 8px;
    font-size: 1.2em;
}

.link-text {
    font-weight: 400;
    text-transform: lowercase;
}

/* System info */
.system-info {
    border-top: 1px solid var(--accent);
    padding-top: 20px;
    font-size: 0.9em;
    color: var(--color7);
}

.info-line {
    margin-bottom: 5px;
    display: flex;
    align-items: center;
}

.info-line::before {
    content: '▸';
    color: var(--accent);
    margin-right: 8px;
}

/* Matrix rain effect */
.matrix-char {
    position: absolute;
    color: var(--accent);
    font-family: 'JetBrains Mono', monospace;
    font-size: 14px;
    opacity: 0.8;
    pointer-events: none;
    animation: matrixFall linear infinite;
}

@keyframes matrixFall {
    0% {
        transform: translateY(-100vh);
        opacity: 0;
    }
    10% {
        opacity: 0.8;
    }
    90% {
        opacity: 0.8;
    }
    100% {
        transform: translateY(100vh);
        opacity: 0;
    }
}

/* Responsive design */
@media (max-width: 768px) {
    .terminal-container {
        width: 95%;
        margin: 20px;
    }
    
    .terminal-body {
        padding: 20px;
    }
    
    .time-text {
        font-size: 2em;
    }
    
    .links-grid {
        grid-template-columns: repeat(auto-fit, minmax(120px, 1fr));
    }
    
    .ascii-art {
        font-size: 10px;
    }
}

/* Selection styling */
::selection {
    background: var(--selection-background);
    color: var(--selection-foreground);
}

::-moz-selection {
    background: var(--selection-background);
    color: var(--selection-foreground);
}
