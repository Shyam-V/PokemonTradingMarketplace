import React from "react";

import { getFirestore,collection, getDocs,doc,getDoc } from "firebase/firestore"


export const useGetData = () => {
  const [documents, setDocuments] = React.useState([]);
  const db = getFirestore();
  React.useEffect(async() => {

    let arr = [];
    const querySnapshot = await getDocs(collection(db, "Cards"));
    querySnapshot.forEach((doc) => {
    arr.push({ id: doc.id, name:doc.data().name,img:doc.data().images.small })
    })  
    setDocuments(arr);

  }, [db]);
  return [documents];
};

export const useGetDataOne = (id) => {
  const [documents, setDocuments] = React.useState([]);
  const db = getFirestore();
  React.useEffect(async() => {

    const docRef = doc(db, "Cards", id);
  const docSnap = await getDoc(docRef);

  if (docSnap.exists()) {
    //console.log("Document data:", docSnap.data());
    setDocuments(docSnap.data())
  } else {
    // doc.data() will be undefined in this case
    console.log("No such document!");
  }
}, [db]);

  return [documents];
};