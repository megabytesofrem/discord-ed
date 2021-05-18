const Discord = require('discord.js');
const client = new Discord.Client();

// TODO: dont hardcode this
const token = process.env.TOKEN;

let sessionTape = '';
let messageResolved = null;

// Tape of the "interactive" history
let hasGottenMessage = false;
let tape = [];

let state = {
    inSession: false,
    currVar: '',
    currMode: ''
};

function convertMode(mode, author, v) {
    switch (mode) {
    case 'message':
        tape.push({'type': 'message', 'author': author.username, 'body': v});  
        //sessionTape += `\n,m\n${v}\n$`;
        break;
    }
}

function renderTranscript() {
    let total = '```\n'; // ARGH MUTABILITY :(
    
    for (const m of tape) {
        console.log(m)

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
        tape.push({'type': 'info', 'body': 'discord-ed session started!'});
        msg.channel.send(renderTranscript());
        ///   log(sessionMessage);
        
        break;
    case 'm':
        if (state.inSession) {
            state.currMode = 'message';
        }
        break;
    }
};

client.on('ready', () => console.log('logged in'));

client.on('message', msg => {
    if (msg.author.bot) {
        if (!hasGottenMessage && messageResolved == null) {
            messageResolved = msg;
            hasGottenMessage = true;
        }
    }

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
                messageResolved.edit(renderTranscript());
            
                state.currMode = '';
                msg.delete();
            }
            return;
        }
        else if (command == '!*') {
            // Reset stuff and close the "session"
            state.currMode = '';
            state.currVar = '';
            
            state.inSession = false;

            tape.push({'type': 'info', 'body': 'discord-ed session ended!'});
            messageResolved.edit(renderTranscript());

            messageResolved = null;
            msg.delete();
            return;
        }
        
        else if (state.currMode == 'message') {
            state.currVar = command;
            msg.delete();
            return;
        }
    }

    //if (state.inSession && messageResolved != null && sessionTape.length > 1)
    //    messageResolved.edit(sessionTape + '```');
});

client.login(token);
