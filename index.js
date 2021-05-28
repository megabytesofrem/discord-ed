const Discord = require('discord.js');
const client = new Discord.Client();

// TODO: dont hardcode this
const token = process.env.TOKEN;

let sessionTape = '';
let sessionMessage = null;
let sessionChannel = null;

// Tape of the "interactive" history
let tape = [];

let state = {
    inSession: false,
    currVar: '',
    currMode: ''
};

function tapePush(line) {
    console.log(line)
    tape.push(line)
};

function convertMode(mode, author, v) {
    switch (mode) {
    case 'message':
        tapePush({'type': 'message', 'author': author.username, 'body': v});  
        //sessionTape += `\n,m\n${v}\n$`;
        break;
    }
}

function renderTranscript() {
    let total = '```\n'; // ARGH MUTABILITY :(
    
    for (const m of tape) {
        if (m.type == 'info') {
            total += `\n ** ${m.body}\n`;
        }

        if (m.type == 'message') {
            total += `\n,m\n${m.body} :<${m.author}> \n$`;
        }
    }

    total += '```';
    return total;
}

function renderMessageHistory() {
    // Render the messages sent in a more readable way
    let total = '```\n';

    for (const m of tape) {
        if (m.type == 'info') {
            total += `\n ** ${m.body}\n`;
        }

        if (m.type == 'message') {
            total += `\n:<${m.author}> ${m.body}\n`;
        }
    }

    total += '```\n';
    return total;
}


function handleCommand(msg, c) {
    // bad haskell naming habits gogogo
    switch (c) {
    case '@':
        if (!state.inSession) {
            state.inSession = true;
        }
        // Send initial message
        //sessionTape = '```vim\n,@\n** discord-ed session started';

        tape = [];
        tapePush({'type': 'info', 'body': 'discord-ed session started!'});
        msg.channel.send(renderTranscript())
        .then(msg => {
            sessionMessage = msg;
            sessionChannel = msg.channel;
        });
        ///   log(sessionMessage);
        
        break;
    case 'm':
        if (state.inSession) {
            state.currMode = 'message';
        }
        break;
    }
};

function editSessionMessage(str) {
    if (sessionMessage) {
        sessionMessage.edit(str)
        .catch(err => {
            tapePush({'type': 'error', 'body': `failed to edit session msg, resetting session`})
            resetSession(true);
        });
    } else {
        tapePush({'type': 'error', 'body': `fatal error, session msg was null, resetting session`});
        resetSession(true);
    }
}

/**
 * Resets the current session
 * @param {bool} [notifyChannel=false] - should notify session channel that an error occurred and the session is being reset
 */
function resetSession(notifyChannel = false) {
    if (notifyChannel) {
        sessionChannel.send("an error has occurred and the session has been reset")
    }
    
    // Reset stuff and close the "session"
    state.currMode = '';
    state.currVar = '';
    
    state.inSession = false;
    
    sessionMessage = null;
    sessionChannel = null;

    tapePush({'type': 'info', 'body': 'discord-ed session ended!'});
};

client.on('ready', () => console.log('logged in'));

client.on('message', msg => {
    let command = msg.content;

    if (command == '$ed-render') {
        // Display the messages interactively
        msg.channel.send(renderMessageHistory());
    }
    
    // ed commands
    if (command.startsWith(',')) {
        handleCommand(msg, command.substring(1));
        msg.delete();
    }
    else {
        if (command == '$') {
            // exit mode
            if (state.inSession) {
                convertMode(state.currMode, msg.author, state.currVar);
                editSessionMessage(renderTranscript())
            
                state.currMode = '';
                msg.delete();
            }
            return;
        }
        else if (command == '!*') {
            editSessionMessage(renderTranscript())
            resetSession();
            
            msg.delete();
            return;
        }
        
        else if (state.currMode == 'message') {
            state.currVar = command;
            msg.delete();
            return;
        }
    }
});

client.login(token);
