# discord-ed
Ever wanted the *powerful* features of ed, the standard UNIX editor on your spyware ridden Tencent owned platform?
Well then today is your lucky day!

## Deploying
The script can be deployed on both UNIX and NixOS.
To deploy on UNIX, run `node index.js`. To deploy on a NixOS based system run
```sh
nix-shell -A shell
node index.js
```

## Usage
Begin a session using `,@`, end a session using `!*`. This will start a session for your server so anyone can join in!

### Example
```
,@<RET>
,m<RET>
[content]<RET>
$<RET>
!*<RET>
```

