// CWE-352: CSRF - Play Action without check
import play.api.mvc._

class CsrfController extends Controller {
  // ruleid: scala-csrf
  def transfer = Action { request =>
    Ok("transferred")
  }

  // ruleid: scala-csrf
  def update = Action { implicit request =>
    Ok("updated")
  }

  // ruleid: scala-csrf
  def delete = Action { Ok("deleted") }

  // ok: scala-csrf
  def safe = Action { request =>
    val token = CSRF.getToken(request).map(_.value).getOrElse("")
    if (CSRFCheck(request)) Ok("ok") else Forbidden
  }

  // ok: scala-csrf
  def safe2 = Action { request =>
    if (csrfToken == request.headers.get("Csrf-Token")) Ok("ok") else Unauthorized
  }
}
