le sleep 1 ; do
  curUsage=$(cat /proc/net/dev | grep enp0s3 | awk '{print $2}')
    sleep 1
      nextUsage=$(cat /proc/net/dev | grep enp0s3 | awk '{print $2}')
        perSecond=$(echo $nextUsage-$curUsage | bc)
	  KB=$(echo $perSecond/1024 | bc)
	    printf "$KB\n" >> "internet.txt"
	      tail -n 60 internet.txt > tmpFile && mv tmpFile internet.txt
	        clear
		  if [ $perSecond -gt 1073741823 ] ; then
			            GB=$(echo "$perSecond/1073741824" | bc)
				            echo "Internet usage: $GB GB" | bc
					      elif [ $perSecond -gt 1048576 ] ; then
						                MB=$(echo "$perSecond/1048576" | bc)
								        echo "Internet usage: $MB MB"
									  elif [ $perSecond -gt 1024 ] ; then
										          echo "Internet usage: $KB KB"
											    else
												            echo "Internet usage: $perSecond B"
													      fi
													        echo "set term dumb; plot 'internet.txt' with linespoints title 'KB/s'" | gnuplot 2>/dev/null

														  awk '{print "Uptime⌚: "int($1/3600)" days, "int(($1%3600)/60)" mins,  "int($1%60)" seconds"}' /proc/uptime

														    echo "Battery 🔋: "
														      upower -i $(upower -e | grep '/battery') | grep --color=never -E "state|to\ full|to\ empty|percentage"

														        load=$(cut -d ' ' -f1 /proc/loadavg)
															  echo "System load 💪: $load"

														  done
														  ~                                                                                                                                                                                                          
														  ~                        
