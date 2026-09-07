def permit_index
  # ruleid: check-permit-attributes-high
  params.permit(:admin)
end

def permit_other
  # ruleid: check-permit-attributes-high
  params.permit(:account_id)
end

def permit_third
  # ruleid: check-permit-attributes-high
  params.require(:user).permit(:admin)
end

def permit_safe
  # ok: check-permit-attributes-high
  params.permit(:name)
end

def permit_email
  # ok: check-permit-attributes-high
  params.permit(:email)
end

def permit_require
  # ok: check-permit-attributes-high
  params.require(:user)
end
