
To make sure your files are saved under /home/qgis you will have to create a crontab so that the files are being copied every minute:


Step 1: Run "crontab -e" without the ""

Step 2: Press i

Step 3: Put the following line in the file (Do not copy paste):
*/1 * * * * /home/qgis/.qgis/autocopyscript.sh

Step 4: Press the "Esc" (Escape) button

Step 5: Now type :w and press the "Return" (Enter) key

Step 6: The last thing you need to do is to type :q and press the "Return" (Enter) key





WARNING: You probably don't have a chromebook account like this: qgis@example.com. The only things you have to change are the following:

1. At step number 3 you need to change this:
*/1 * * * * /home/qgis/.qgis/autocopyscript.sh

To this:
*/1 * * * * /home/YOURUSERNAME/.qgis/autocopyscript.sh



2. in the folder .qgis in your home directory (it's a hidden folder, to be able to see it press the three dots in the upper right of the files app and select "Show hidden files") there is a file called autocopyscript.sh.


You need to edit that file and change this:
target="/home/qgis"

To this:
target="/home/YOURUSERNAME"
