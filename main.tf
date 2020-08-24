resource "kubernetes_service" "mysql_service" {
  metadata = {
    name = "wordpress-mysql"
    label = {
        app = "${var.app_label}"
    }
  }

  spec {
    slector {
        app = "${var.app_label}"
        tier = "${var.mysql_tier}"
    }
    port {
        port = "3306"
    }
    type = "NodePort"
}
