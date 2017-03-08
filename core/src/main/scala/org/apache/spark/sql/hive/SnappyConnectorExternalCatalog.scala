/*
 * Copyright (c) 2016 SnappyData, Inc. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you
 * may not use this file except in compliance with the License. You
 * may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
 * implied. See the License for the specific language governing
 * permissions and limitations under the License. See accompanying
 * LICENSE file.
 */

package org.apache.spark.sql.hive

import org.apache.hadoop.conf.Configuration

import org.apache.spark.sql.{SmartConnectorHelper, SnappySession}
import org.apache.spark.sql.catalyst.catalog.{FunctionResource, CatalogFunction}
import org.apache.spark.sql.hive.client.HiveClient

private[spark] class SnappyConnectorExternalCatalog(var cl: HiveClient,
    hadoopConf: Configuration) extends SnappyExternalCatalog(cl, hadoopConf) {

  // --------------------------------------------------------------------------
  // Functions
  // --------------------------------------------------------------------------

  override def createFunction(
      db: String,
      funcDefinition: CatalogFunction): Unit = {
    val functionName = funcDefinition.identifier.funcName
    val className = funcDefinition.className
    val funcResourcesArray: Array[(String, String)] = new Array(funcDefinition.resources.length)
    funcDefinition.resources.zipWithIndex.foreach {
      case (fr: FunctionResource, index: Int) =>
        funcResourcesArray(index) = (fr.resourceType.resourceType, fr.uri)
    }

    SmartConnectorHelper.executeCreateUDFStatement(db, functionName, className, funcResourcesArray)
    SnappySession.clearAllCache()
  }

  override def dropFunction(db: String, name: String): Unit = {
    SmartConnectorHelper.executeDropUDFStatement(db, name)
    SnappySession.clearAllCache()
  }
}
