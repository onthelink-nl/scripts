
To make sure your files are saved under /home/qgis you will have to create a crontab so that the files are being copied every minute:


Step 1: Run "crontab -e" without the ""

Step 2: Press i

Step 3: Put the following line in the file (Do not copy paste):
*/1 * * * * rsync -a /run/user/1000/doc/by-app/org.qgis.qgis /home/qgis

Step 4: Press the "Esc" (Escape) button

Step 5: Now type :w and press the "Return" (Enter) key

Step 6: The last thing you need to do is to type :q and press the "Return" (Enter) key





WARNING: You probably don't have a chromebook account like this: qgis@example.com. The only thing you need to change is:

1. At step number 3 you need to change this:
*/1 * * * * rsync -a /run/user/1000/doc/by-app/org.qgis.qgis /home/qgis

To this:
*/1 * * * * rsync -a /run/user/1000/doc/by-app/org.qgis.qgis /home/YOURUSERNAME
