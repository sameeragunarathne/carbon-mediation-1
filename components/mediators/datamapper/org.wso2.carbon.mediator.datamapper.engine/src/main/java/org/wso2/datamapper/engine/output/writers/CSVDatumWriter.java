/*
 * Copyright (c) 2016, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
 *
 * WSO2 Inc. licenses this file to you under the Apache License,
 * Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License.
 * You may obtain a copy of the License at
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied. See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */


package org.wso2.datamapper.engine.output.writers;

import org.apache.avro.Schema;
import org.apache.avro.generic.GenericDatumWriter;
import org.apache.avro.generic.GenericRecord;
import org.apache.avro.io.Encoder;
import org.json.CDL;
import org.json.JSONArray;
import org.json.JSONException;

import java.io.IOException;


public class CSVDatumWriter extends GenericDatumWriter<GenericRecord> {

    @Override
    protected void writeArray(Schema schema, Object datum, Encoder out)
            throws IOException {
        try {
            JSONArray jsonArray = new JSONArray(datum.toString());
            out.writeString(CDL.toString(jsonArray));
        } catch (JSONException e) {
            throw new IOException(e);
        }
    }

}
