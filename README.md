# Docker environment for INU OS Course

## Getting started

1. Install `docker` for your platform
    * Windows
        * Install WSL2
            * Open PowerShell as Administrator
            * Enter following commands to install WSL2 \
              `wsl --install`
              `wsl --set-default-version 2`
            * Enter following command to allow scripting \
              `Set-ExecutionPolicy RemoteSigned`
            * Microsoft's guide for install WSL 2: https://learn.microsoft.com/en-us/windows/wsl/install
        * https://docs.docker.com/docker-for-windows/wsl/
    * Mac
        * https://docs.docker.com/desktop/setup/install/mac-install/

2. Install `git` for your platform
    * Windows
        * (Optional) Installing Windows Terminal \
          You can installing it from Microsoft Store: https://apps.microsoft.com/detail/9n0dx20hk701
        * Check for Git: Open Windows Terminal and type `git --version`.
        * Install Git: If you receive an error, download and install git: https://git-scm.com/downloads
    * Mac
        * Check for Git: Open Terminal and type `git --version`.
        * If Git is not installed, follow the on-screen prompts or try running `xcode-select --install`

3. Clone this repository \
  `git clone https://github.com/INUOS-s26/os-docker-env.git`

4. Start the container
    * Mac/Linux: Run `./learncli.sh`.
    * Windows: Run `./learncli.ps1`.
    * When you start the Docker image, Docker will create the `workdir` directory that is bridged between the image and your native operating system, where you can copy and move files between the the two.
    * Be sure to use `exit` command to finish the session to stop the container.

5. Configuring Git Environment Variable \ 
To avoid entering `git config --global ...` after each restart you can set your git environmental variable in `.bash_profile`
    1. Start your container (`./learncli.sh` or `./learncli.ps1`).
    2. Open `../.bash_profile` in your favorite text editor (`vim ../.bash_profile`).
    3. Change lines 8-11 from
```
    #export GIT_AUTHOR_NAME=""
    #export GIT_COMMITTER_NAME=""
    #export GIT_AUTHOR_EMAIL=""
    #export GIT_COMMITTER_EMAIL=""
```
to
```
    export GIT_AUTHOR_NAME="Your Name"
    export GIT_COMMITTER_NAME="Your Name"
    export GIT_AUTHOR_EMAIL="you@email.com"
    export GIT_COMMITTER_EMAIL="you@email.com"
```
    4. restart the container

6. Setting up SSH authentication for Github

* On your local computer
    1. Navigate to the os-docker-env directory that contains `learncli.sh` file, but do not execute it.
    2. Type `ssh-keygen`, type `.ssh/id_rsa` as the location to save the key, and press enter for no passphrase at the password prompt.
```
$ ssh-keygen
Generating public/private rsa key pair.
Enter file in which to save the key (/home/root/.ssh/id_rsa): .ssh/id_rsa
Enter passphrase (empty for no passphrase):
Enter same passphrase again:
Your identification has been saved in .ssh/id_rsa.
Your public key has been saved in .ssh/id_rsa.pub.
The key fingerprint is:
SHA256:4yheFb7P2rzq/fJ71+AKPssyEQq7+bI0YcnK8+rzfr8 ceclia@topkek
The key's randomart image is:
+---[RSA 2048]----+
|                 |
|                 |
|        .        |
|   ... ...       |
|    =o .S.       |
| . o...+.o    .  |
|  + +oo o..  . ..|
|  .=++. oOo.  o o|
| .o=*=.oE*@B=+ . |
+----[SHA256]-----+
```
    3. Running cat `.ssh/id_rsa.pub` should output the needed key as text to the console, which you should copy for the next part.


* On Github
    1. Click your profile in the top right corner.
    2. Click Settings -> SSH and GPG keys -> New SSH Key.
    3. Paste the contents of `.ssh/id_rsa.pub` into the "Key" section.
    4. Give it a Title and click "Add SSH Key".
