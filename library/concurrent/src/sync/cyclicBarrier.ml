(*
 * This file is part of OCaml-Java library.
 * Copyright (C) 2007-2015 Xavier Clerc.
 *
 * OCaml-Java library is free software; you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation; either version 3 of the License, or
 * (at your option) any later version.
 *
 * OCaml-Java library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *)

open Class'java'util'concurrent'CyclicBarrier
open Class'java'util'concurrent'TimeUnit

type t = _'CyclicBarrier java_instance

let make n =
  Java.make "CyclicBarrier(int)" n

let await cb =
  Java.call "CyclicBarrier.await()" cb

let await_time cb time timeunit =
  Java.call "CyclicBarrier.await(long,TimeUnit)" cb time timeunit

let get_number_waiting cb =
  Java.call "CyclicBarrier.getNumberWaiting()" cb

let get_parties cb =
  Java.call "CyclicBarrier.getParties()" cb

let is_broken cb =
  Java.call "CyclicBarrier.isBroken()" cb

let reset cb =
  Java.call "CyclicBarrier.reset()" cb


(* Null value *)

external null : unit -> 'a java_instance =
  "java null"

let null = null ()

external is_null : 'a java_instance -> bool =
  "java is_null"

external is_not_null : 'a java_instance -> bool =
  "java is_not_null"


(* Miscellaneous *)

let wrap x =
  if is_null x then
    None
  else
    Some x

let unwrap = function
  | Some x -> x
  | None   -> null
