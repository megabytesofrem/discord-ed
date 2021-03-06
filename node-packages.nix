# This file has been generated by node2nix 1.8.0. Do not edit!

{nodeEnv, fetchurl, fetchgit, globalBuildInputs ? []}:

let
  sources = {
    "@discordjs/collection-0.1.6" = {
      name = "_at_discordjs_slash_collection";
      packageName = "@discordjs/collection";
      version = "0.1.6";
      src = fetchurl {
        url = "https://registry.npmjs.org/@discordjs/collection/-/collection-0.1.6.tgz";
        sha512 = "utRNxnd9kSS2qhyivo9lMlt5qgAUasH2gb7BEOn6p0efFh24gjGomHzWKMAPn2hEReOPQZCJaRKoURwRotKucQ==";
      };
    };
    "@discordjs/form-data-3.0.1" = {
      name = "_at_discordjs_slash_form-data";
      packageName = "@discordjs/form-data";
      version = "3.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/@discordjs/form-data/-/form-data-3.0.1.tgz";
        sha512 = "ZfFsbgEXW71Rw/6EtBdrP5VxBJy4dthyC0tpQKGKmYFImlmmrykO14Za+BiIVduwjte0jXEBlhSKf0MWbFp9Eg==";
      };
    };
    "abort-controller-3.0.0" = {
      name = "abort-controller";
      packageName = "abort-controller";
      version = "3.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/abort-controller/-/abort-controller-3.0.0.tgz";
        sha512 = "h8lQ8tacZYnR3vNQTgibj+tODHI5/+l06Au2Pcriv/Gmet0eaj4TwWH41sO9wnHDiQsEj19q0drzdWdeAHtweg==";
      };
    };
    "asynckit-0.4.0" = {
      name = "asynckit";
      packageName = "asynckit";
      version = "0.4.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/asynckit/-/asynckit-0.4.0.tgz";
        sha1 = "c79ed97f7f34cb8f2ba1bc9790bcc366474b4b79";
      };
    };
    "combined-stream-1.0.8" = {
      name = "combined-stream";
      packageName = "combined-stream";
      version = "1.0.8";
      src = fetchurl {
        url = "https://registry.npmjs.org/combined-stream/-/combined-stream-1.0.8.tgz";
        sha512 = "FQN4MRfuJeHf7cBbBMJFXhKSDq+2kAArBlmRBvcvFE5BB1HZKXtSFASDhdlz9zOYwxh8lDdnvmMOe/+5cdoEdg==";
      };
    };
    "delayed-stream-1.0.0" = {
      name = "delayed-stream";
      packageName = "delayed-stream";
      version = "1.0.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/delayed-stream/-/delayed-stream-1.0.0.tgz";
        sha1 = "df3ae199acadfb7d440aaae0b29e2272b24ec619";
      };
    };
    "discord.js-12.5.3" = {
      name = "discord.js";
      packageName = "discord.js";
      version = "12.5.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/discord.js/-/discord.js-12.5.3.tgz";
        sha512 = "D3nkOa/pCkNyn6jLZnAiJApw2N9XrIsXUAdThf01i7yrEuqUmDGc7/CexVWwEcgbQR97XQ+mcnqJpmJ/92B4Aw==";
      };
    };
    "event-target-shim-5.0.1" = {
      name = "event-target-shim";
      packageName = "event-target-shim";
      version = "5.0.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/event-target-shim/-/event-target-shim-5.0.1.tgz";
        sha512 = "i/2XbnSz/uxRCU6+NdVJgKWDTM427+MqYbkQzD321DuCQJUqOuJKIA0IM2+W2xtYHdKOmZ4dR6fExsd4SXL+WQ==";
      };
    };
    "mime-db-1.47.0" = {
      name = "mime-db";
      packageName = "mime-db";
      version = "1.47.0";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-db/-/mime-db-1.47.0.tgz";
        sha512 = "QBmA/G2y+IfeS4oktet3qRZ+P5kPhCKRXxXnQEudYqUaEioAU1/Lq2us3D/t1Jfo4hE9REQPrbB7K5sOczJVIw==";
      };
    };
    "mime-types-2.1.30" = {
      name = "mime-types";
      packageName = "mime-types";
      version = "2.1.30";
      src = fetchurl {
        url = "https://registry.npmjs.org/mime-types/-/mime-types-2.1.30.tgz";
        sha512 = "crmjA4bLtR8m9qLpHvgxSChT+XoSlZi8J4n/aIdn3z92e/U47Z0V/yl+Wh9W046GgFVAmoNR/fmdbZYcSSIUeg==";
      };
    };
    "node-fetch-2.6.1" = {
      name = "node-fetch";
      packageName = "node-fetch";
      version = "2.6.1";
      src = fetchurl {
        url = "https://registry.npmjs.org/node-fetch/-/node-fetch-2.6.1.tgz";
        sha512 = "V4aYg89jEoVRxRb2fJdAg8FHvI7cEyYdVAh94HH0UIK8oJxUfkjlDQN9RbMx+bEjP7+ggMiFRprSti032Oipxw==";
      };
    };
    "prism-media-1.2.9" = {
      name = "prism-media";
      packageName = "prism-media";
      version = "1.2.9";
      src = fetchurl {
        url = "https://registry.npmjs.org/prism-media/-/prism-media-1.2.9.tgz";
        sha512 = "UHCYuqHipbTR1ZsXr5eg4JUmHER8Ss4YEb9Azn+9zzJ7/jlTtD1h0lc4g6tNx3eMlB8Mp6bfll0LPMAV4R6r3Q==";
      };
    };
    "setimmediate-1.0.5" = {
      name = "setimmediate";
      packageName = "setimmediate";
      version = "1.0.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/setimmediate/-/setimmediate-1.0.5.tgz";
        sha1 = "290cbb232e306942d7d7ea9b83732ab7856f8285";
      };
    };
    "tweetnacl-1.0.3" = {
      name = "tweetnacl";
      packageName = "tweetnacl";
      version = "1.0.3";
      src = fetchurl {
        url = "https://registry.npmjs.org/tweetnacl/-/tweetnacl-1.0.3.tgz";
        sha512 = "6rt+RN7aOi1nGMyC4Xa5DdYiukl2UWCbcJft7YhxReBGQD7OAM8Pbxw6YMo4r2diNEA8FEmu32YOn9rhaiE5yw==";
      };
    };
    "ws-7.4.5" = {
      name = "ws";
      packageName = "ws";
      version = "7.4.5";
      src = fetchurl {
        url = "https://registry.npmjs.org/ws/-/ws-7.4.5.tgz";
        sha512 = "xzyu3hFvomRfXKH8vOFMU3OguG6oOvhXMo3xsGy3xWExqaM2dxBbVxuD99O7m3ZUFMvvscsZDqxfgMaRr/Nr1g==";
      };
    };
  };
  args = {
    name = "discord-ed";
    packageName = "discord-ed";
    version = "1.0.0";
    src = ./.;
    dependencies = [
      sources."@discordjs/collection-0.1.6"
      sources."@discordjs/form-data-3.0.1"
      sources."abort-controller-3.0.0"
      sources."asynckit-0.4.0"
      sources."combined-stream-1.0.8"
      sources."delayed-stream-1.0.0"
      sources."discord.js-12.5.3"
      sources."event-target-shim-5.0.1"
      sources."mime-db-1.47.0"
      sources."mime-types-2.1.30"
      sources."node-fetch-2.6.1"
      sources."prism-media-1.2.9"
      sources."setimmediate-1.0.5"
      sources."tweetnacl-1.0.3"
      sources."ws-7.4.5"
    ];
    buildInputs = globalBuildInputs;
    meta = {
      description = "ed but in discord!";
      license = "ISC";
    };
    production = true;
    bypassCache = true;
    reconstructLock = true;
  };
in
{
  args = args;
  sources = sources;
  tarball = nodeEnv.buildNodeSourceDist args;
  package = nodeEnv.buildNodePackage args;
  shell = nodeEnv.buildNodeShell args;
}