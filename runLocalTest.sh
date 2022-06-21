cd resources
python3 -m http.server 3000 &
pid=$!
robot ../tests/LocalTest.robot
kill $pid