//  Copyright 2024 International Digital Economy Academy
// 
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
// 
//      http://www.apache.org/licenses/LICENSE-2.0
// 
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

///|
test {
  let buf = @lib.Buffer::new(4)
  buf.append_int(256)
  buf.append_int(255)
  let content = buf.to_bytes()
  inspect(content[:].to_int_be(), content="256")
  inspect(content[4:].to_int_be(), content="255")
  let buf1 = @lib.Buffer::new(4)
  buf1.append_int(257)
  buf.truncate(buf1)
  let content = buf.to_bytes()
  inspect(content[8:].to_int_be(), content="257")
}
