# Extract the .json files first and output them to a new folder
# cd to the folder with a strain's analysis, eg. UD803, and my output folder is called "UD803_output", under the same folder where UD803 is stored
  cd /Users/alexis/Dropbox/Research/GEM/Intestine_GEM_selected/UD803_ints_wt/
  cd ..
  mkdir UD803_output
  find UD803_ints_wt/ -type f -name "*.json" -exec cp {} UD803_output/ \;
  Get-ChildItem -Path "UD803_ints_wt"/" -Recurse -Filter "*.json" | Copy-Item -Destination "UD803_output/"

# Now I should see the folder "output" full of many .json files
# Next extract all the D of MSD values from all the .json files and output them into a single .csv folder
# cd to the folder that contains all the .json files
# Set the name of the output CSV file
  output_file="D_msd_values.csv"

# Write the header row to the CSV file
  echo "D_msd (um^2/s),value" > $output_file

# Iterate over each JSON file in the directory
  for file in *.json
    do
    # Extract the value of "D_msd (um^2/s)" from the file
    d_msd=$(jq -r '.["D_msd (um^2/s)"]' "$file")
    # Write the D_msd key and value to the CSV file
    echo "D_msd (um^2/s),$d_msd" >> $output_file
  done


# If output D_pwd (um^2/s),value, just change the msd to pwd
  output_file2="D_pwd_values.csv"
  echo "D_pwd (um^2/s),value" > $output_file2
  for file in *.json
    do
    # Extract the value of "D_pwd (um^2/s)" from the file
    d_pwd=$(jq -r '.["D_pwd (um^2/s)"]' "$file")
    # Write the D_pwd key and value to the CSV file
    echo "D_pwd (um^2/s),$d_pwd" >> $output_file2
  done



