  #!/bin/sh
printf '\e[31m
 ______     ______     ______   ______   __     __   __     ______        __  __     ______      ______     ______     __    __     ______     
/\  ___\   /\  ___\   /\__  _\ /\__  _\ /\ \   /\ "-.\ \   /\  ___\      /\ \/\ \   /\  == \    /\  ___\   /\  __ \   /\ "-./  \   /\  == \    
\ \___  \  \ \  __\   \/_/\ \/ \/_/\ \/ \ \ \  \ \ \-.  \  \ \ \__ \     \ \ \_\ \  \ \  _-/    \ \ \____  \ \  __ \  \ \ \-./\ \  \ \  _-/    
 \/\_____\  \ \_____\    \ \_\    \ \_\  \ \_\  \ \_\\"\_\  \ \_____\     \ \_____\  \ \_\       \ \_____\  \ \_\ \_\  \ \_\ \ \_\  \ \_\      
  \/_____/   \/_____/     \/_/     \/_/   \/_/   \/_/ \/_/   \/_____/      \/_____/   \/_/        \/_____/   \/_/\/_/   \/_/  \/_/   \/_/      
                                                                                                                                               
'
if [ "$1" == "remount" ]; then
  diskutil mount /dev/disk1s3
else
  #Get mount point of BOOTCAMP SSD
  disk=$(mount | grep 'BOOTCAMP SSD' | cut -d" " -f1)
  printf "\e[1;31m\e[47mSetting up BOOTCAMP SSD permissions....\e[0m\n"
  chmod 777 $disk
  printf "\e[1;31m\e[47mUnmounting BOOTCAMP SSD parition ($disk)....\e[0m\n"
  diskutil umount $disk
  #Get mount point of BOOTCAMP DATA
  disk2=$(mount | grep 'BOOTCAMP DATA' | cut -d" " -f1)
  printf "\e[1;31m\e[47mSetting up BOOTCAMP DATA permissions....\e[0m\n"
  chmod 777 $disk2
  printf "\e[1;31m\e[47mUnmounting BOOTCAMP DATA parition ($disk)....\e[0m\n"
  diskutil umount $disk2

  line=$(awk 'NR==13' ~/VirtualBox\ VMs/bootcamp_ssd.vmdk)
  line2=$(awk 'NR==12' ~/VirtualBox\ VMs/bootcamp_data.vmdk)
  if [ "$line" != "RW 195702784 FLAT \"$disk\" 0" ] || [ "$line2" != "RW 487972864 FLAT \"$disk2\" 0" ]; then
    printf "\e[1;37m\e[41mThe virtual machine is refering to the wrong partition and will not boot!!\e[0m\n"
  else
    printf "\e[1;31m\e[47mStarting virtual machine....\e[0m\n"
    sudo -H -u mulla_35 bash -c 'vboxmanage startvm Bootcamp'
  fi
  export disk=$disk
fi 