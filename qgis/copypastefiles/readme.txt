
To make sure your files are saved under /home/qgis you will have to create a crontab so that the files are being copied every minute:


Step 1: Run "crontab -e" without the ""

Step 2: Press i

Step 3: Put the following line in the file (Do not copy paste):
*/1 * * * * /home/qgis/.qgis/autocopyscript.sh

Step 4: Press the "Esc" (Escape) button

Step 5: Now type :w and press the "Return" (Enter) key

Step 6: The last thing you need to do is to type :q and press the "Return" (Enter) key
