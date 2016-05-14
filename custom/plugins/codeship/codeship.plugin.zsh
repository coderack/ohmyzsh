# CLI support for CODESHIP interaction
#
# See README.md for details

: ${CODESHIP_DEFAULT_ACTION:=new}

function codeship() {
  emulate -L zsh
  local action=${1:=$CODESHIP_DEFAULT_ACTION}

  local codeship_url codeship_prefix
  if [[ -f .codeship-url ]]; then
    codeship_url=$(cat .codeship-url)
  elif [[ -f ~/.codeship-url ]]; then
    codeship_url=$(cat ~/.codeship-url)
  elif [[ -n "${CODESHIP_URL}" ]]; then
    codeship_url=${CODESHIP_URL}
  else
    _codeship_url_help
    return 1
  fi

  if [[ -f .codeship-prefix ]]; then
    codeship_prefix=$(cat .codeship-prefix)
  elif [[ -f ~/.codeship-prefix ]]; then
    codeship_prefix=$(cat ~/.codeship-prefix)
  elif [[ -n "${CODESHIP_PREFIX}" ]]; then
    codeship_prefix=${CODESHIP_PREFIX}
  else
    codeship_prefix=""
  fi

  open_command "${codeship_url}"
}

function _codeship_url_help() {
  cat << EOF
error: CODESHIP URL is not specified anywhere.

Valid options, in order of precedence:
  .codeship-url file
  \$HOME/.codeship-url file
  \$CODESHIP_URL environment variable
EOF
}

function _codeship_query() {
  emulate -L zsh
  local verb="$1"
  local codeship_name lookup preposition query
  if [[ "${verb}" == "reported" ]]; then
    lookup=reporter
    preposition=by
  elif [[ "${verb}" == "assigned" ]]; then
    lookup=assignee
    preposition=to
  else
    echo "error: not a valid lookup: $verb" >&2
    return 1
  fi
  codeship_name=${2:=$CODESHIP_NAME}
  if [[ -z $codeship_name ]]; then
    echo "error: CODESHIP_NAME not specified" >&2
    return 1
  fi

  echo "Browsing issues ${verb} ${preposition} ${codeship_name}"
  query="${lookup}+%3D+%22${codeship_name}%22+AND+resolution+%3D+unresolved+ORDER+BY+priority+DESC%2C+created+ASC"
  open_command "${codeship_url}/secure/IssueNavigator.jspa?reset=true&jqlQuery=${query}"
}
