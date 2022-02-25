import React from "react";

import { getFirestore,collection, getDocs } from "firebase/firestore"


export const useGetData = () => {
  const [documents, setDocuments] = React.useState([]);
  const db = getFirestore();
  React.useEffect(async() => {

    let arr = [];
    const querySnapshot = await getDocs(collection(db, "Cards"));
    querySnapshot.forEach((doc) => {
    console.log(doc.data().images)
    arr.push({ id: doc.id, name:doc.data().name,img:doc.data().images.small })
    })  
    setDocuments(arr);

  }, [db]);
  return [documents];
};