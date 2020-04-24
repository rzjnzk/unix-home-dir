See: <https://www.howtoforge.com/tutorial/clamav-ubuntu/>

`sudo freshclam`
    - Running this will check for updates clamav updates.
    - It may be a good idea to add a `cron` job for this command.


> Now we are ready to scan our system. To do this, you can use the “clamscan” command. This is a rich command that can work with many different parameters so you'd better insert “clamscan –-help” on the terminal first and see the various things that what you can do with it.
    - Consider command flags, then procees to add `cron` job[s] for this command, and alter any other configuraation files.

`clamscan -r --bell -i "${HOME}/Downloads"`

> `clamscan -r /`
Will output infected files after a full scan of the system.
