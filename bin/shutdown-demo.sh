#!/bin/bash




kill_known_pids () {
	BIN_DIR="$( cd "$( dirname "$0" )" && pwd )"
	. $BIN_DIR/env.sh

	for PID in `cat ${RUN_DIR}/*.pid`
	do
	   kill -TERM ${PID}
	done
}

kill_java_pids () {
	#here's how to hit it with a hammer

	for JAVAPID in `pgrep java`
	do
		kill -9 ${JAVAPID}
		echo "killed JAVA process ${JAVAPID}"
	done

}

kill_py_pids () {
	#and an even heavier hammer

	for PYTHONPID in `pgrep python`
	do
		kill -9 ${PYTHONPID}
		echo "killed PYTHON process ${PYTHONPID}"
	done

}


echo "killing known pids..1st pass"
kill_known_pids

echo "sleeping 15 seconds.."
sleep 15

echo "killing known pids..2nd pass"
kill_known_pids

if [ `pgrep java|wc -l` -gt 0 ]
	then echo "some java pids were left..killing"
	kill_java_pids
fi

if [ `pgrep python|wc -l` -gt 0 ]
	then echo "some python pids were left..killing"
	kill_py_pids
fi


echo "we are going to try killing everything again for good measure, you might see some no such process errors..ignore"

kill_known_pids
kill_java_pids
kill_py_pids

#for PID in `ps ax | grep mapr_spout | awk '{print $1}'`
#do
#   kill -TERM ${PID}
#done
