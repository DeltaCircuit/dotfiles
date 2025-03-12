function log_error() {
    app_name=$1
    message=$2
    logger -p crit -t $app_name "$message"
}

function log_warning() {
    app_name=$1
    message=$2
    logger -p warning -t $app_name "$message"
}

function log_info() {
    app_name=$1
    message=$2
    logger -p info -t $app_name "$message"
}

