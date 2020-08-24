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

resource "kubernetes_deployment" "mysql_deployment" {
  metadata = {
    name = "wordpress-mysql"
    label = {
        app = "${var.app_label}"
    }
  }

  spec {
    replicas = "1"

    slector {
    match_labels {
        app ="${var.app_label}"
        tier = "${var.mysql_tier}"
        }
    }

    template {
        metadata {
            labels {
                app = "${var.app_label}"
                tier = "${var.mysql_tier}"
            }
        }
        template {
            metadata {
                labels {
                    app = "${var.app_label}"
                    tier = "${var.mysql_tier}"
                }
            }
            spec {
                container {
                    name = "mysql"
                    image = "mysql:5.7"

                    env {
                        name = "MYSQK_ROOT_PASSWORD"
                        value = "${var.mysql_password}"
                    }
                    port {
                        container_port = "3306"
                        name = "mysql"
                    }
                }
            }
        }
    }
}


