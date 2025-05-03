resource "grafana_dashboard" "grafana" {
  folder = grafana_folder.terraform_dashboards.uid
  config_json = jsonencode({
    "annotations" : {
      "list" : [
        {
          "builtIn" : 1,
          "datasource" : {
            "type" : "grafana",
            "uid" : "-- Grafana --"
          },
          "enable" : true,
          "hide" : true,
          "iconColor" : "rgba(0, 211, 255, 1)",
          "name" : "Annotations & Alerts",
          "type" : "dashboard"
        }
      ]
    },
    "editable" : true,
    "fiscalYearStartMonth" : 0,
    "graphTooltip" : 0,
    "id" : 3,
    "links" : [],
    "panels" : [
      {
        "collapsed" : false,
        "gridPos" : {
          "h" : 1,
          "w" : 24,
          "x" : 0,
          "y" : 0
        },
        "id" : 8,
        "panels" : [],
        "title" : "Logs",
        "type" : "row"
      },
      {
        "datasource" : "logs",
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "palette-classic"
            },
            "custom" : {
              "axisBorderShow" : false,
              "axisCenteredZero" : false,
              "axisColorMode" : "text",
              "axisLabel" : "",
              "axisPlacement" : "auto",
              "barAlignment" : 0,
              "barWidthFactor" : 0.6,
              "drawStyle" : "line",
              "fillOpacity" : 0,
              "gradientMode" : "none",
              "hideFrom" : {
                "legend" : false,
                "tooltip" : false,
                "viz" : false
              },
              "insertNulls" : false,
              "lineInterpolation" : "linear",
              "lineWidth" : 1,
              "pointSize" : 5,
              "scaleDistribution" : {
                "type" : "linear"
              },
              "showPoints" : "auto",
              "spanNulls" : false,
              "stacking" : {
                "group" : "A",
                "mode" : "none"
              },
              "thresholdsStyle" : {
                "mode" : "off"
              }
            },
            "mappings" : [],
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green"
                }
              ]
            }
          },
          "overrides" : [
            {
              "matcher" : {
                "id" : "byName",
                "options" : "_source"
              },
              "properties" : []
            },
            {
              "matcher" : {
                "id" : "byName",
                "options" : "kubernetes.container_name"
              },
              "properties" : []
            }
          ]
        },
        "gridPos" : {
          "h" : 9,
          "w" : 24,
          "x" : 0,
          "y" : 1
        },
        "id" : 11,
        "interval" : "$${TimeForOneDataPoint}",
        "options" : {
          "legend" : {
            "calcs" : [
              "sum"
            ],
            "displayMode" : "table",
            "placement" : "right",
            "showLegend" : true
          },
          "tooltip" : {
            "hideZeros" : false,
            "mode" : "single",
            "sort" : "none"
          }
        },
        "pluginVersion" : "11.6.1",
        "targets" : [
          {
            "alias" : "",
            "bucketAggs" : [
              {
                "field" : "@timestamp",
                "id" : "2",
                "settings" : {
                  "interval" : "auto"
                },
                "type" : "date_histogram"
              }
            ],
            "datasource" : "logs",
            "hide" : false,
            "metrics" : [
              {
                "id" : "1",
                "type" : "count"
              }
            ],
            "query" : "kubernetes.container_name: $${ServiceName}",
            "refId" : "A",
            "timeField" : "@timestamp"
          }
        ],
        "title" : "Logs count",
        "type" : "timeseries"
      },
      {
        "datasource" : "logs",
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "thresholds"
            },
            "custom" : {
              "align" : "auto",
              "cellOptions" : {
                "type" : "auto"
              },
              "inspect" : true
            },
            "mappings" : [],
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green"
                }
              ]
            }
          },
          "overrides" : [
            {
              "matcher" : {
                "id" : "byName",
                "options" : "_source"
              },
              "properties" : [
                {
                  "id" : "custom.width",
                  "value" : 607
                }
              ]
            },
            {
              "matcher" : {
                "id" : "byName",
                "options" : "kubernetes.container_name"
              },
              "properties" : [
                {
                  "id" : "custom.width",
                  "value" : 397
                }
              ]
            }
          ]
        },
        "gridPos" : {
          "h" : 8,
          "w" : 12,
          "x" : 0,
          "y" : 10
        },
        "id" : 9,
        "options" : {
          "cellHeight" : "sm",
          "footer" : {
            "countRows" : false,
            "fields" : "",
            "reducer" : [
              "sum"
            ],
            "show" : false
          },
          "showHeader" : true,
          "sortBy" : [
            {
              "desc" : true,
              "displayName" : "_source"
            }
          ]
        },
        "pluginVersion" : "11.6.1",
        "targets" : [
          {
            "alias" : "",
            "bucketAggs" : [],
            "datasource" : "logs",
            "hide" : false,
            "metrics" : [
              {
                "id" : "1",
                "settings" : {
                  "limit" : "500"
                },
                "type" : "logs"
              }
            ],
            "query" : "kubernetes.container_name: $${ServiceName}",
            "refId" : "A",
            "timeField" : "@timestamp"
          }
        ],
        "title" : "Latest logs",
        "transformations" : [
          {
            "id" : "extractFields",
            "options" : {
              "delimiter" : ",",
              "format" : "json",
              "replace" : true,
              "source" : "_source"
            }
          },
          {
            "id" : "filterByValue",
            "options" : {
              "filters" : [
                {
                  "config" : {
                    "id" : "equal",
                    "options" : {
                      "value" : "stdout"
                    }
                  },
                  "fieldName" : "stream"
                }
              ],
              "match" : "any",
              "type" : "include"
            }
          },
          {
            "id" : "filterFieldsByName",
            "options" : {
              "include" : {
                "names" : [
                  "log"
                ]
              }
            }
          }
        ],
        "type" : "table"
      },
      {
        "datasource" : "logs",
        "fieldConfig" : {
          "defaults" : {
            "color" : {
              "mode" : "thresholds"
            },
            "custom" : {
              "align" : "auto",
              "cellOptions" : {
                "type" : "auto"
              },
              "inspect" : true
            },
            "mappings" : [],
            "thresholds" : {
              "mode" : "absolute",
              "steps" : [
                {
                  "color" : "green"
                }
              ]
            }
          },
          "overrides" : [
            {
              "matcher" : {
                "id" : "byName",
                "options" : "_source"
              },
              "properties" : [
                {
                  "id" : "custom.width",
                  "value" : 607
                }
              ]
            },
            {
              "matcher" : {
                "id" : "byName",
                "options" : "kubernetes.container_name"
              },
              "properties" : [
                {
                  "id" : "custom.width",
                  "value" : 397
                }
              ]
            }
          ]
        },
        "gridPos" : {
          "h" : 8,
          "w" : 12,
          "x" : 12,
          "y" : 10
        },
        "id" : 10,
        "options" : {
          "cellHeight" : "sm",
          "footer" : {
            "countRows" : false,
            "fields" : "",
            "reducer" : [
              "sum"
            ],
            "show" : false
          },
          "showHeader" : true,
          "sortBy" : [
            {
              "desc" : true,
              "displayName" : "_source"
            }
          ]
        },
        "pluginVersion" : "11.6.1",
        "targets" : [
          {
            "alias" : "",
            "bucketAggs" : [],
            "datasource" : "logs",
            "hide" : false,
            "metrics" : [
              {
                "id" : "1",
                "settings" : {
                  "limit" : "500"
                },
                "type" : "logs"
              }
            ],
            "query" : "kubernetes.container_name: $${ServiceName}",
            "refId" : "A",
            "timeField" : "@timestamp"
          }
        ],
        "title" : "Latest error logs",
        "transformations" : [
          {
            "id" : "extractFields",
            "options" : {
              "delimiter" : ",",
              "format" : "json",
              "replace" : true,
              "source" : "_source"
            }
          },
          {
            "id" : "filterByValue",
            "options" : {
              "filters" : [
                {
                  "config" : {
                    "id" : "equal",
                    "options" : {
                      "value" : "stderr"
                    }
                  },
                  "fieldName" : "stream"
                }
              ],
              "match" : "any",
              "type" : "include"
            }
          },
          {
            "id" : "filterFieldsByName",
            "options" : {
              "include" : {
                "names" : [
                  "log"
                ]
              }
            }
          }
        ],
        "type" : "table"
      },
      {
        "collapsed" : true,
        "gridPos" : {
          "h" : 1,
          "w" : 24,
          "x" : 0,
          "y" : 18
        },
        "id" : 2,
        "panels" : [
          {
            "datasource" : {
              "type" : "prometheus"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  }
                },
                "mappings" : [],
                "unit" : "bytes"
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 6,
              "w" : 8,
              "x" : 0,
              "y" : 38
            },
            "id" : 5,
            "options" : {
              "legend" : {
                "displayMode" : "table",
                "placement" : "right",
                "showLegend" : true,
                "values" : [
                  "value"
                ]
              },
              "pieType" : "donut",
              "reduceOptions" : {
                "calcs" : [
                  "lastNotNull"
                ],
                "fields" : "",
                "values" : false
              },
              "tooltip" : {
                "hideZeros" : false,
                "mode" : "single",
                "sort" : "none"
              }
            },
            "pluginVersion" : "11.6.1",
            "targets" : [
              {
                "datasource" : {
                  "type" : "prometheus"
                },
                "editorMode" : "code",
                "expr" : "kube_pod_container_resource_requests{service=\"kube-state-metrics\", container=\"$${ServiceName}\", resource=\"memory\", unit=\"byte\"}",
                "legendFormat" : "$${ServiceName} RAM - requests",
                "range" : true,
                "refId" : "A"
              },
              {
                "datasource" : {
                  "type" : "prometheus"
                },
                "editorMode" : "code",
                "expr" : "kube_pod_container_resource_limits{service=\"kube-state-metrics\", container=\"$${ServiceName}\", resource=\"memory\", unit=\"byte\"}",
                "hide" : false,
                "instant" : false,
                "legendFormat" : "$${ServiceName} RAM - limits",
                "range" : true,
                "refId" : "B"
              }
            ],
            "title" : "Memory requests and limits",
            "type" : "piechart"
          },
          {
            "datasource" : {
              "type" : "prometheus"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  }
                },
                "mappings" : []
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 6,
              "w" : 8,
              "x" : 8,
              "y" : 38
            },
            "id" : 6,
            "options" : {
              "legend" : {
                "displayMode" : "table",
                "placement" : "right",
                "showLegend" : true,
                "values" : [
                  "value"
                ]
              },
              "pieType" : "donut",
              "reduceOptions" : {
                "calcs" : [
                  "lastNotNull"
                ],
                "fields" : "",
                "values" : false
              },
              "tooltip" : {
                "hideZeros" : false,
                "mode" : "single",
                "sort" : "none"
              }
            },
            "pluginVersion" : "11.6.1",
            "targets" : [
              {
                "datasource" : {
                  "type" : "prometheus"
                },
                "editorMode" : "code",
                "expr" : "kube_pod_container_resource_requests{service=\"kube-state-metrics\", container=\"$${ServiceName}\", resource=\"cpu\", unit=\"core\"}",
                "legendFormat" : "$${ServiceName} CPUs",
                "range" : true,
                "refId" : "A"
              },
              {
                "datasource" : {
                  "type" : "prometheus"
                },
                "editorMode" : "code",
                "expr" : "kube_pod_container_resource_limits{service=\"kube-state-metrics\", container=\"$${ServiceName}\", resource=\"cpu\", unit=\"core\"}",
                "hide" : false,
                "instant" : false,
                "legendFormat" : "$${ServiceName}  CPUs",
                "range" : true,
                "refId" : "B"
              }
            ],
            "title" : "CPU requests and limits",
            "type" : "piechart"
          },
          {
            "datasource" : {
              "type" : "prometheus"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  }
                },
                "mappings" : [],
                "unit" : "bytes"
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 6,
              "w" : 8,
              "x" : 16,
              "y" : 38
            },
            "id" : 7,
            "options" : {
              "legend" : {
                "displayMode" : "table",
                "placement" : "right",
                "showLegend" : true,
                "values" : [
                  "value"
                ]
              },
              "pieType" : "donut",
              "reduceOptions" : {
                "calcs" : [
                  "lastNotNull"
                ],
                "fields" : "",
                "values" : false
              },
              "tooltip" : {
                "hideZeros" : false,
                "mode" : "single",
                "sort" : "none"
              }
            },
            "pluginVersion" : "11.6.1",
            "targets" : [
              {
                "datasource" : {
                  "type" : "prometheus"
                },
                "editorMode" : "code",
                "expr" : "kube_pod_container_resource_requests{service=\"kube-state-metrics\", container=\"$${ServiceName}\", resource=\"ephemeral_storage\", unit=\"byte\"}",
                "legendFormat" : "$${ServiceName} ephemeral storage - requests",
                "range" : true,
                "refId" : "A"
              },
              {
                "datasource" : {
                  "type" : "prometheus"
                },
                "editorMode" : "code",
                "expr" : "kube_pod_container_resource_limits{service=\"kube-state-metrics\", container=\"$${ServiceName}\", resource=\"ephemeral_storage\", unit=\"byte\"}",
                "hide" : false,
                "instant" : false,
                "legendFormat" : "$${ServiceName} ephemeral storage - limits",
                "range" : true,
                "refId" : "B"
              }
            ],
            "title" : "Ephemeral storage requests and limits",
            "type" : "piechart"
          },
          {
            "datasource" : {
              "type" : "prometheus"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "barWidthFactor" : 0.6,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                },
                "unit" : "percentunit"
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 6,
              "w" : 24,
              "x" : 0,
              "y" : 44
            },
            "id" : 4,
            "interval" : "$TimeForOneDataPoint",
            "options" : {
              "legend" : {
                "calcs" : [
                  "mean"
                ],
                "displayMode" : "table",
                "placement" : "right",
                "showLegend" : true
              },
              "tooltip" : {
                "hideZeros" : false,
                "mode" : "single",
                "sort" : "none"
              }
            },
            "pluginVersion" : "11.6.1",
            "targets" : [
              {
                "datasource" : {
                  "type" : "prometheus"
                },
                "editorMode" : "code",
                "expr" : "sum(rate(container_cpu_usage_seconds_total{pod=~\"$${ServiceName}-.*\"}[$TimeForOneDataPoint])) / max(kube_pod_container_resource_requests{service=\"kube-state-metrics\", container=\"$${ServiceName}\", resource=\"cpu\", unit=\"core\"}) ",
                "legendFormat" : "CPU",
                "range" : true,
                "refId" : "A"
              },
              {
                "datasource" : {
                  "type" : "prometheus"
                },
                "editorMode" : "code",
                "expr" : "sum(rate(container_memory_usage_bytes{pod=~\"$${ServiceName}-.*\"}[$TimeForOneDataPoint])) / max(kube_pod_container_resource_requests{service=\"kube-state-metrics\", container=\"$${ServiceName}\", resource=\"memory\", unit=\"byte\"}) ",
                "hide" : false,
                "instant" : false,
                "legendFormat" : "RAM",
                "range" : true,
                "refId" : "B"
              }
            ],
            "title" : "Resource utilisation",
            "type" : "timeseries"
          },
          {
            "datasource" : {
              "type" : "prometheus"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "barWidthFactor" : 0.6,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                }
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 7,
              "w" : 12,
              "x" : 0,
              "y" : 50
            },
            "id" : 1,
            "interval" : "$TimeForOneDataPoint",
            "options" : {
              "legend" : {
                "calcs" : [
                  "mean"
                ],
                "displayMode" : "table",
                "placement" : "right",
                "showLegend" : true
              },
              "tooltip" : {
                "hideZeros" : false,
                "mode" : "single",
                "sort" : "none"
              }
            },
            "pluginVersion" : "11.6.1",
            "targets" : [
              {
                "datasource" : {
                  "type" : "prometheus"
                },
                "editorMode" : "code",
                "expr" : "max(kube_pod_status_phase{pod=~\"$${ServiceName}.*\", service=\"kube-state-metrics\"}) by (phase)",
                "legendFormat" : "{{phase}} pods",
                "range" : true,
                "refId" : "A"
              }
            ],
            "title" : "Number pods by phase",
            "type" : "timeseries"
          },
          {
            "datasource" : {
              "type" : "prometheus"
            },
            "fieldConfig" : {
              "defaults" : {
                "color" : {
                  "mode" : "palette-classic"
                },
                "custom" : {
                  "axisBorderShow" : false,
                  "axisCenteredZero" : false,
                  "axisColorMode" : "text",
                  "axisLabel" : "",
                  "axisPlacement" : "auto",
                  "barAlignment" : 0,
                  "barWidthFactor" : 0.6,
                  "drawStyle" : "line",
                  "fillOpacity" : 0,
                  "gradientMode" : "none",
                  "hideFrom" : {
                    "legend" : false,
                    "tooltip" : false,
                    "viz" : false
                  },
                  "insertNulls" : false,
                  "lineInterpolation" : "linear",
                  "lineWidth" : 1,
                  "pointSize" : 5,
                  "scaleDistribution" : {
                    "type" : "linear"
                  },
                  "showPoints" : "auto",
                  "spanNulls" : false,
                  "stacking" : {
                    "group" : "A",
                    "mode" : "none"
                  },
                  "thresholdsStyle" : {
                    "mode" : "off"
                  }
                },
                "mappings" : [],
                "thresholds" : {
                  "mode" : "absolute",
                  "steps" : [
                    {
                      "color" : "green"
                    },
                    {
                      "color" : "red",
                      "value" : 80
                    }
                  ]
                }
              },
              "overrides" : []
            },
            "gridPos" : {
              "h" : 7,
              "w" : 12,
              "x" : 12,
              "y" : 50
            },
            "id" : 3,
            "interval" : "$TimeForOneDataPoint",
            "options" : {
              "legend" : {
                "calcs" : [
                  "sum"
                ],
                "displayMode" : "table",
                "placement" : "right",
                "showLegend" : true
              },
              "tooltip" : {
                "hideZeros" : false,
                "mode" : "single",
                "sort" : "none"
              }
            },
            "pluginVersion" : "11.6.1",
            "targets" : [
              {
                "datasource" : {
                  "type" : "prometheus"
                },
                "editorMode" : "code",
                "expr" : "sum(increase(kube_pod_init_container_status_restarts_total{service=\"kube-state-metrics\",pod=~\"$${ServiceName}-.*\"}[$TimeForOneDataPoint]))",
                "legendFormat" : "Container restarts",
                "range" : true,
                "refId" : "A"
              }
            ],
            "title" : "Container restarts",
            "type" : "timeseries"
          }
        ],
        "title" : "Container Insights - $${ServiceName}",
        "type" : "row"
      }
    ],
    "preload" : false,
    "schemaVersion" : 41,
    "tags" : [],
    "templating" : {
      "list" : [
        {
          "current" : {
            "text" : "5m",
            "value" : "5m"
          },
          "name" : "TimeForOneDataPoint",
          "options" : [
            {
              "selected" : false,
              "text" : "30s",
              "value" : "30s"
            },
            {
              "selected" : false,
              "text" : "1m",
              "value" : "1m"
            },
            {
              "selected" : true,
              "text" : "5m",
              "value" : "5m"
            },
            {
              "selected" : false,
              "text" : "10m",
              "value" : "10m"
            },
            {
              "selected" : false,
              "text" : "30m",
              "value" : "30m"
            },
            {
              "selected" : false,
              "text" : "1h",
              "value" : "1h"
            },
            {
              "selected" : false,
              "text" : "2h",
              "value" : "2h"
            },
            {
              "selected" : false,
              "text" : "6h",
              "value" : "6h"
            },
            {
              "selected" : false,
              "text" : "12h",
              "value" : "12h"
            },
            {
              "selected" : false,
              "text" : "24h",
              "value" : "24h"
            }
          ],
          "query" : "30s,1m,5m,10m,30m,1h,2h,6h,12h,24h",
          "type" : "custom"
        },
        {
          "current" : {
            "text" : "grafana",
            "value" : "grafana"
          },
          "hide" : 2,
          "name" : "ServiceName",
          "query" : "grafana",
          "skipUrlSync" : true,
          "type" : "constant"
        }
      ]
    },
    "time" : {
      "from" : "now-24h",
      "to" : "now"
    },
    "timepicker" : {},
    "timezone" : "browser",
    "title" : "Grafana"
  })
}