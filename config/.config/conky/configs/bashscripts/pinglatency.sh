ping -c 1 www.duckduckgo.com | sed -ne '/.*time=/{;s///;s/\..*//;p;}'

