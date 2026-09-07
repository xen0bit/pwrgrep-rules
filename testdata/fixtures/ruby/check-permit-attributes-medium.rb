def permit_index
  # ruleid: check-permit-attributes-medium
  params.permit(:role)
end

def permit_other
  # ruleid: check-permit-attributes-medium
  params.permit(:banned)
end

def permit_third
  # ruleid: check-permit-attributes-medium
  params.require(:user).permit(:role)
end

def permit_safe
  # ok: check-permit-attributes-medium
  params.permit(:name)
end

def permit_email
  # ok: check-permit-attributes-medium
  params.permit(:email)
end

def permit_require
  # ok: check-permit-attributes-medium
  params.require(:user)
end
