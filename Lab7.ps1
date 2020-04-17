<#
    Powershell Lab 7
    Manipulate users, OUs, groups, and group membership
    Date: 4/8/20
    Created by: Jonathan Sourivong


#>
Clear-Host
$menu=@"
Choose from the following Menu Items:
A. View one OU `t B. View all OUs
C. View one group `t D. View all Groups
E. View one user `t F. View all users`n
G. Create one OU `t H. Create one group
I. Create one user `t J. Create users from CSV file`n
K. Add user to group `t L. Remove user from group`n
M. DELETE one group `t N. DELETE one user`n
Enter anything other than A - N to quit
"@



do
    {
      $menu
      $item = read-host "A,B,C,D,E,F,G,H,I,J,K,L,M,N"
      if ($item -eq "A"){
      Read-Host $ouname "Enter name of OU to view"
      Get-adorganizationalunit -include $ouname | Format-Table name, distinguished name
      Read-Host "Press enter to continue"
      }#A
      elseif($item -eq "B"){
      get-adorganizationalunit -exclude domaincontroller -recurse | Format-Table name, distguished name
      Read-Host "Press enter to continue"
      }
      elseif($item -eq "C"){
      Read-Host $groupname "Enter name of the group to view"
      Get-LocalGroup -include $groupname | Format-Table name, group scope, group category
      Read-Host "Press enter to continue"

      }
      elseif($item -eq "D"){
      get-localgroup -recurse | Format-Table name, group scope, group category
      Read-Host "Press enter to continue"
      }
      elseif($item -eq "E"){
      Read-Host $username "Enter name of user"
      Get-LocalUser -include $username | Format-Table name, distguished name
      Read-Host "Press enter to continue"
      }
      elseif($item -eq "F"){
      Get-LocalUser -recurse | Format-Table name, distinguished name, first name, last name
      Read-Host "Press enter to continue"
      }
      elseif($item -eq "G"){
      Read-Host $createou "Enter name of OU to create"
      new-adorganizationalunit $createou
      get-adorganizationalunit -include $createou |Format-Table name, distinguished name
      Read-Host "Press enter to continue"
      }
      elseif($item -eq "H"){
      Read-host $creategroup "Enter name of group to create"
      New-LocalGroup $creategroup
      get-adorganizationalunit -include $creategroup | Format-Table name, group scope, group category
      Read-Host "Press enter to continue"
      }
      elseif($item -eq "I"){

      }
      elseif($item -eq "J"){

      }
      elseif($item -eq "K"){

      }
      elseif($item -eq "L"){

      }
      elseif($item -eq "M"){
      Read-Host $groupdel "Enter the name of the group to delete"
      Remove-LocalGroup -identity $groupdel
      Get-LocalGroup -recurse | Format-Table name, group scope, group category
      Read-Host "Press enter to continue"
      }
      elseif($item -eq "N"){
      Read-Host $deluser "Enter the name of the user to delete"
      Remove-LocalUser -identity $deluser
      Get-LocalUser -recurse | Format-Table name, distinguished name
      Read-Host "Press enter to continue"
      }
      pause
    }until($item -eq "o,p,q,r,s,t,u,v,w,x,y,z") 



    

