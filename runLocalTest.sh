cd resources
python -m http.server 3000 &
pid=$!
robot ../tests/LocalTest.robot
kill $pid